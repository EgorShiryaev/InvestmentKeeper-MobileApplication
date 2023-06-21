import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/investment_asset.dart';
import '../../cubits/account_cubit/account_cubit.dart';
import '../../pages/arguments/account_page_arguments.dart';
import '../../pages/arguments/instrument_page_arguments.dart';
import '../../pages/instrument_page.dart';
import '../../themes/app_theme.dart';
import '../main_page/investment_asset_view.dart';

class StructureItemView extends StatelessWidget {
  final String title;
  final List<InvestmentAsset> items;
  const StructureItemView({
    super.key,
    required this.title,
    required this.items,
  });

  void navigateToInstrumentPage(InvestmentAsset asset) {
    final account = (Get.arguments as AccountPageArguments).account;
    final instrumentPageArgs =
        InstrumentPageArguments(asset: asset, account: account);
    Get.find<AccountCubit>().unsubscrubeToPrice();
    Get.toNamed(InstrumentPage.routeName, arguments: instrumentPageArgs)!
        .then((value) {
      Get.find<AccountCubit>()
        ..subscribeToPrice()
        ..refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineSmall;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppTheme.pagePadding.left,
              right: AppTheme.pagePadding.right,
            ),
            child: Text(title, style: titleStyle),
          ),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(items.length, (index) {
              final item = items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: InkWell(
                  onTap: () => navigateToInstrumentPage(item),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppTheme.pagePadding.left,
                    ),
                    child: InvestmentAssetView(item: item),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
