import 'package:flutter/material.dart';

import '../../../core/utils/get_profit_color.dart';
import '../../../domain/entities/account_entity.dart';

class AccountStatus extends StatelessWidget {
  final AccountEntity account;
  const AccountStatus({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    final textColor = getProfitTextColor(account.profit);
    final backgroundColor = getProfitBackgroundColor(account.profit);

    final textStyle =
        Theme.of(context).textTheme.bodySmall?.copyWith(color: textColor);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        child: Text(
          '${account.profit} ₽ · ${account.profitPercent}%',
          style: textStyle,
        ),
      ),
    );
  }
}
