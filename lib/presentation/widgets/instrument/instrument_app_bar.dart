import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/currency_utils/get_currency_char.dart';
import '../../pages/arguments/instrument_page_arguments.dart';
import '../../themes/app_theme.dart';
import '../scroll_under_flexible_space.dart';

class InstumentAppBar extends StatelessWidget {
  const InstumentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final asset = (Get.arguments as InstrumentPageArguments).asset;

    final price = asset.currentPriceNum;
    final title = asset.instrument.title;
    final titleLarge25Chars = title.length > 25;

    final currencyChar = getCurrencyChar(asset.instrument.currency);

    final priceTextStyle = Theme.of(context).textTheme.headlineMedium;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    final priceSmallTextStyle = Theme.of(context).textTheme.titleLarge;
    final titleSmallTextStyle = Theme.of(context).textTheme.titleSmall;
    return SliverAppBar.large(
      scrolledUnderElevation: AppTheme.sliverAppBarScrolledUnderElevation,
      expandedHeight: titleLarge25Chars
          ? AppTheme.sliverAppBarTitleTwoLinesTextHeight + 12
          : null,
      flexibleSpace: SafeArea(
        top: false,
        bottom: false,
        child: LargeSliverAppBarFlexibleSpace(
          collapsedTitle: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: titleSmallTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                Text('$price $currencyChar', style: priceSmallTextStyle),
              ],
            ),
          ),
          expandedTitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: titleStyle,
                maxLines: 2,
              ),
              Text('$price $currencyChar', style: priceTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
