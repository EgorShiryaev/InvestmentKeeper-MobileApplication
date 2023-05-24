import 'package:flutter/material.dart';

import '../../../core/utils/get_profit_color.dart';
import '../../../domain/entities/account_item_entity.dart';

class AccountItemView extends StatelessWidget {
  final AccountItemEntity item;
  const AccountItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final lotsColor = Theme.of(context).colorScheme.outline;
    final lotsStyle =
        Theme.of(context).textTheme.bodySmall!.copyWith(color: lotsColor);

    final color = getProfitTextColor(item.profit);
    final profitStyle = lotsStyle.copyWith(color: color);

    final averagePriceText = item.averagePurchasePrice.toStringAsFixed(2);
    final totalCurrentPriceText = item.totalCurrentPrice.toStringAsFixed(2);
    final profitText = item.profit.toStringAsFixed(2);
    final profitPersentText = item.profitPercent.toStringAsFixed(2);
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
                  '${item.totalLots} шт. · $averagePriceText ₽',
                  style: lotsStyle,
                ),
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
