import 'package:flutter/material.dart';

import '../../../core/utils/currency_utils/get_currency_char.dart';
import '../../../domain/entities/investment_asset.dart';
import '../profit_widget.dart';
import 'investment_asset_price_view.dart';

class InvestmentAssetView extends StatelessWidget {
  final InvestmentAsset item;
  const InvestmentAssetView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final lotsColor = Theme.of(context).colorScheme.outline;
    final lotsStyle =
        Theme.of(context).textTheme.bodySmall!.copyWith(color: lotsColor);
    final currencyChar = getCurrencyChar(item.instrument.currency);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.instrument.title, style: titleStyle),
                Text(
                  '${item.totalLots} шт. · '
                  '${item.averagePurchasePriceNum} $currencyChar',
                  style: lotsStyle,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InvestmentAssetPriceView(
                currency: item.instrument.currency,
                price: item.totalCurrentPriceNum,
              ),
              ProfitWidget(
                profit: item.profit,
                profitPercent: item.profitPercent,
                currency: item.instrument.currency,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
