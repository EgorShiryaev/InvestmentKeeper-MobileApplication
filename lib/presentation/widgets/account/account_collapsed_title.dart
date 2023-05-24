import 'package:flutter/material.dart';

import '../../../core/utils/get_profit_color.dart';
import '../../../domain/entities/account_entity.dart';

class AccountCollapsedTitle extends StatelessWidget {
  final AccountEntity account;
  const AccountCollapsedTitle({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    final profitColor = getProfitTextColor(account.profit);
    final profitStyle =
        Theme.of(context).textTheme.bodySmall?.copyWith(color: profitColor);

    final totalPrice =
        (account.balance + account.currentPrice).toStringAsFixed(2);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$totalPrice ₽', style: titleStyle),
        Text(
          '${account.profit} ₽ · ${account.profitPercent}%',
          style: profitStyle,
        ),
      ],
    );
  }
}
