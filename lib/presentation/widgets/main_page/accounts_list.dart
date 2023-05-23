import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../domain/entities/account.dart';
import '../../cubits/accounts_cubit/accounts_state.dart';
import 'account_card.dart';

class AccountsList extends HookWidget {
  final AccountsState state;
  const AccountsList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final accountsState = useState(<Account>[]);

    useEffect(
      () {
        if (state is LoadedAccountsState) {
          accountsState.value = (state as LoadedAccountsState).accounts;
        }
        return null;
      },
      [state],
    );

    return Column(
      children: List.generate(accountsState.value.length, (index) {
        final item = accountsState.value[index];
        return AccountCard(account: item);
      }),
    );
  }
}
