import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../domain/entities/account_entity.dart';
import '../../cubits/account_cubit/account_state.dart';
import '../../pages/arguments/account_page_arguments.dart';
import '../scroll_under_flexible_space.dart';
import 'account_collapsed_title.dart';
import 'account_expanded_title.dart';

class AccountSliverAppBar extends HookWidget {
  final AccountState state;
  const AccountSliverAppBar({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    final accountState = useState<AccountEntity?>(null);

    useEffect(
      () {
        final args = Get.arguments;
        if (args is AccountPageArguments) {
          accountState.value = args.account;
        }
        return null;
      },
      [],
    );

    useEffect(
      () {
        if (state is LoadedAccountState) {
          accountState.value = (state as LoadedAccountState).account;
        }
        return null;
      },
      [state],
    );

    final account = accountState.value;

    if (account == null) {
      return const SizedBox();
    }

    final price = account.currentPrice + account.mainCurrencyDeposit.value;

    return LargeSliverAppBarFlexibleSpace(
      collapsedTitle: AccountCollapsedTitle(price: price, account: account),
      expandedTitle: AccountExpandedTitle(price: price, account: account),
    );
  }
}
