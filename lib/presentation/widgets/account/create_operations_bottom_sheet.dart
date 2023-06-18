import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/account_entity.dart';
import '../../pages/arguments/create_purchase_page_arguments.dart';
import '../../pages/arguments/create_refill_page_arguments.dart';
import '../../pages/arguments/create_sale_page_arguments.dart';
import '../../pages/create_purchase_page.dart';
import '../../pages/create_refill_page.dart';
import '../../pages/create_sale_page.dart';
import '../../themes/app_theme.dart';
import '../iconed_button.dart';

class CreateOperationsBottomSheet extends StatelessWidget {
  final AccountEntity account;
  const CreateOperationsBottomSheet({super.key, required this.account});

  void navigateToCreatePurchasePage() {
    hideBottomSheet();
    Get.toNamed(
      CreatePurchasePage.routeName,
      arguments: CreatePurchasePageArguments(account: account),
    );
  }

  void navigateToCreateSalePage() {
    hideBottomSheet();
    Get.toNamed(
      CreateSalePage.routeName,
      arguments: CreateSalePageArguments(account: account),
    );
  }

  void navigateToCreateRefillPage() {
    hideBottomSheet();
    Get.toNamed(
      CreateRefillPage.routeName,
      arguments: CreateRefillPageArguments(account: account),
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
            onPress: () => {},
          ),
        ],
      ),
    );
  }
}
