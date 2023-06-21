import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/arguments/create_purchase_page_arguments.dart';
import '../../pages/arguments/create_sale_page_arguments.dart';
import '../../pages/arguments/instrument_page_arguments.dart';
import '../../pages/create_purchase_page.dart';
import '../../pages/create_sale_page.dart';
import '../../themes/app_theme.dart';

class InstrumentButtonBar extends StatelessWidget {
  const InstrumentButtonBar({super.key});

  void navigateToCreateSalePage() {
    final args = Get.arguments as InstrumentPageArguments;
    Get.toNamed(
      CreateSalePage.routeName,
      arguments: CreateSalePageArguments(
        account: args.account,
        instrument: args.asset.instrument,
      ),
    );
  }

  void navigateToCreatePurchasePage() {
    final args = Get.arguments as InstrumentPageArguments;
    Get.toNamed(
      CreatePurchasePage.routeName,
      arguments: CreatePurchasePageArguments(
        account: args.account,
        instrument: args.asset.instrument,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.horizontalPagePadding.copyWith(top: 16),
      child: Row(
        children: [
          Expanded(
            child: FilledButton(
              onPressed: navigateToCreateSalePage,
              child: const Text('Продать'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: FilledButton.tonal(
              onPressed: navigateToCreatePurchasePage,
              child: const Text('Купить'),
            ),
          ),
        ],
      ),
    );
  }
}
