import 'package:flutter/material.dart';

import '../../../core/utils/get_profit_color.dart';
import '../../../domain/entities/account_item.dart';

class AccountItemView extends StatelessWidget {
  final AccountItem item;
  const AccountItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final lotsColor = Theme.of(context).colorScheme.outline;
    final lotsStyle =
        Theme.of(context).textTheme.bodySmall!.copyWith(color: lotsColor);

    final totalLots = item.lots * item.instrument.lot;
    final totalCurrentPrice = item.currentPrice * totalLots;
    final totalAveragePrice = item.averagePurchasePrice * totalLots;
    final profit = totalCurrentPrice - totalAveragePrice;
    final profitPercent = (-1 + totalCurrentPrice / totalAveragePrice) * 100;

    final color = getProfitTextColor(profit);
    final profitStyle = lotsStyle.copyWith(color: color);

    final averagePriceText = item.averagePurchasePrice.toStringAsFixed(2);
    final totalCurrentPriceText = totalCurrentPrice.toStringAsFixed(2);
    final profitText = profit.toStringAsFixed(2);
    final profitPersentText = profitPercent.toStringAsFixed(2);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.instrument.title, style: titleStyle),
                Text('$totalLots шт. · $averagePriceText ₽', style: lotsStyle),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('$totalCurrentPriceText ₽', style: titleStyle),
              Text('$profitText ₽ · $profitPersentText%', style: profitStyle),
            ],
          ),
        ],
      ),
    );
  }
}
