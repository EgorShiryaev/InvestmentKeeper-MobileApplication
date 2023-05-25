import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/account_entity.dart';
import '../../pages/arguments/rename_account_page_arguments.dart';
import '../../pages/rename_account_page.dart';
import '../../themes/app_theme.dart';
import '../iconed_button.dart';

class SettingsAccountBottomSheet extends StatelessWidget {
  final AccountEntity account;
  const SettingsAccountBottomSheet({super.key, required this.account});

  void navigateToRenameAccountPage() {
    Get.toNamed(
      RenameAccountPage.routeName,
      arguments: RenameAccountPageArguments(account: account),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      minimum: AppTheme.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconedButton(
            icon: Icons.edit_rounded,
            label: 'Переименовать',
            onPress: navigateToRenameAccountPage,
          )
        ],
      ),
    );
  }
}
