import 'package:flutter/material.dart';

import '../../../domain/entities/account.dart';
import '../money_widget.dart';
import '../profit_widget.dart';

class AccountCollapsedTitle extends StatelessWidget {
  final num money;
  final Account account;
  const AccountCollapsedTitle({
    super.key,
    required this.account,
    required this.money,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MoneyWidget(
          currency: account.currency,
          value: money,
          textStyle: titleStyle,
        ),
        ProfitWidget(
          profit: account.profit,
          profitPercent: account.profitPercent,
          currency: account.currency,
        )
      ],
    );
  }
}
