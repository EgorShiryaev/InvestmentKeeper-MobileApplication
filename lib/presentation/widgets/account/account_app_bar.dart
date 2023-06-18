import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/utils/modals_utils/show_custom_bottom_sheet.dart';
import '../../cubits/account_cubit/account_cubit.dart';
import '../../cubits/account_cubit/account_state.dart';
import '../../pages/arguments/account_page_arguments.dart';
import '../../themes/app_theme.dart';
import 'account_sliver_app_bar.dart';
import 'settings_account_bottom_sheet.dart';


class AccountAppBar extends StatelessWidget {
  const AccountAppBar({super.key});

  void showSettingsBottomSheet(BuildContext context) {
    final account = (Get.arguments as AccountPageArguments).account;
    showCustomBottomSheet(
      context,
      bottomSheet: SettingsAccountBottomSheet(account: account),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      scrolledUnderElevation: AppTheme.sliverAppBarScrolledUnderElevation,
      expandedHeight: AppTheme.sliverAppBarTitleTwoLinesTextHeight,
      flexibleSpace: SafeArea(
        top: false,
        bottom: false,
        child: BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            return AccountSliverAppBar(state: state);
          },
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings_rounded),
          onPressed: () => showSettingsBottomSheet(context),
        )
      ],
    );
  }
}
