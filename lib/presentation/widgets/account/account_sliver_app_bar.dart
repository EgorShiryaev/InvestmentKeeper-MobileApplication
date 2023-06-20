import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../domain/entities/account.dart';
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
    final accountState = useState<Account?>(null);

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

    final money = account.totalMoneyValue;

    return LargeSliverAppBarFlexibleSpace(
      collapsedTitle: AccountCollapsedTitle(money: money, account: account),
      expandedTitle: AccountExpandedTitle(price: money, account: account),
    );
  }
}
