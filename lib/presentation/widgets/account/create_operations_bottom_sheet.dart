import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/account.dart';
import '../../cubits/account_cubit/account_cubit.dart';
import '../../pages/arguments/create_purchase_page_arguments.dart';
import '../../pages/arguments/create_refill_page_arguments.dart';
import '../../pages/arguments/create_sale_page_arguments.dart';
import '../../pages/arguments/create_withdrawal_page_arguments.dart';
import '../../pages/create_purchase_page.dart';
import '../../pages/create_refill_page.dart';
import '../../pages/create_sale_page.dart';
import '../../pages/create_withdrawal_page.dart';
import '../../themes/app_theme.dart';
import '../iconed_button.dart';

class CreateOperationsBottomSheet extends StatelessWidget {
  final Account account;
  const CreateOperationsBottomSheet({super.key, required this.account});

  void navigateToOperationPage(String route, args) {
    hideBottomSheet();
    Get.find<AccountCubit>().unsubscrubeToPrice();
    Get.toNamed(route, arguments: args)!
        .then((value) => Get.find<AccountCubit>().subscribeToPrice());
  }

  void navigateToCreatePurchasePage() {
    navigateToOperationPage(
      CreatePurchasePage.routeName,
      CreatePurchasePageArguments(account: account),
    );
  }

  void navigateToCreateSalePage() {
    navigateToOperationPage(
      CreateSalePage.routeName,
      CreateSalePageArguments(account: account),
    );
  }

  void navigateToCreateRefillPage() {
    navigateToOperationPage(
      CreateRefillPage.routeName,
      CreateRefillPageArguments(account: account),
    );
  }

  void navigateToCreateWithdrawalPage() {
    navigateToOperationPage(
      CreateWithdrawalPage.routeName,
      CreateWithdrawalPageArguments(account: account),
    );
  }

  void hideBottomSheet() {
    Get.back();
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
            icon: Icons.shopping_cart_rounded,
            label: 'Покупка',
            onPress: navigateToCreatePurchasePage,
          ),
          IconedButton(
            icon: Icons.sell_rounded,
            label: 'Продажа',
            onPress: navigateToCreateSalePage,
          ),
          IconedButton(
            icon: Icons.download_rounded,
            label: 'Пополнение',
            onPress: navigateToCreateRefillPage,
          ),
          IconedButton(
            icon: Icons.upload_rounded,
            label: 'Вывод средств',
            onPress: navigateToCreateWithdrawalPage,
          ),
        ],
      ),
    );
  }
}
