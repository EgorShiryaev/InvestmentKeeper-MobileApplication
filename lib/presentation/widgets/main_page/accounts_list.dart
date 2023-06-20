import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../domain/entities/account.dart';
import '../../cubits/user_accounts_cubit/user_accounts_state.dart';
import 'account_card.dart';

class AccountsList extends HookWidget {
  final UserAccountsState state;
  const AccountsList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final accountsState = useState(<Account>[]);

    useEffect(
      () {
        if (state is LoadedUserAccountsState) {
          accountsState.value = (state as LoadedUserAccountsState).accounts;
        }
        return null;
      },
      [state],
    );

    return Column(
      children: List.generate(accountsState.value.length, (index) {
        final item = accountsState.value[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AccountCard(account: item),
        );
      }),
    );
  }
}
