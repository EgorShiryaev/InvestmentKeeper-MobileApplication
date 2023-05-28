import 'package:flutter/material.dart';

import '../../../core/utils/get_price_with_currency.dart';
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
                  '${getPriceWithCurrency(
                    item.averagePurchasePrice,
                    item.instrument.currency,
                  )}',
                  style: lotsStyle,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (item.totalCurrentPrice != null)
                InvestmentAssetPriceView(
                  currency: item.instrument.currency,
                  price: item.totalCurrentPrice!,
                ),
              if (item.profit != null && item.profitPercent != null)
                ProfitWidget(
                  profit: item.profit!,
                  profitPercent: item.profitPercent!,
                  currency: item.instrument.currency,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
