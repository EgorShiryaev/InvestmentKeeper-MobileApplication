import 'package:flutter/material.dart';

import '../../core/utils/double_to_string.dart';
import '../../core/utils/get_price_with_currency.dart';
import '../../core/utils/get_profit_color.dart';
import '../../domain/entities/currency.dart';

class ProfitWidget extends StatelessWidget {
  final double profit;
  final double profitPercent;
  final Currency currency;
  const ProfitWidget({
    super.key,
    required this.profit,
    required this.profitPercent,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    final bodySmallStyle = Theme.of(context).textTheme.bodySmall;
    final color = getProfitTextColor(profit);

    final profitStyle = bodySmallStyle!.copyWith(color: color);
    final profitPersentText = doubleToString(profitPercent);

    return Text(
      '${getPriceWithCurrency(profit, currency)} · $profitPersentText%',
      style: profitStyle,
    );
  }
}
