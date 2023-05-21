import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../domain/entities/account.dart';
import '../../cubits/accounts_cubit/accounts_cubit.dart';
import '../../cubits/accounts_cubit/accounts_state.dart';
import 'account_card.dart';

class AccountsList extends HookWidget {
  const AccountsList({super.key});

  @override
  Widget build(BuildContext context) {
    final accountsState = useState(<Account>[]);

    final state = Get.find<AccountsCubit>().state;
    useEffect(() {
      if (state is LoadedAccountsState) {
        accountsState.value = state.accounts;
      }
    }, [state]);

    return Column(
      children: List.generate(accountsState.value.length, (index) {
        final item = accountsState.value[index];
        return AccountCard(account: item);
      }),
    );
  }
}
