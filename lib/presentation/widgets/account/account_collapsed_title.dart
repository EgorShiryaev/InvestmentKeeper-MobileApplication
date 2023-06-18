import 'package:flutter/material.dart';

import '../../../core/utils/currency_utils/get_currency_char.dart';
import '../../../domain/entities/account_entity.dart';
import '../money_widget.dart';
import '../profit_widget.dart';

class AccountCollapsedTitle extends StatelessWidget {
  final double price;
  final AccountEntity account;
  const AccountCollapsedTitle({
    super.key,
    required this.account,
    required this.price,
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
          moneyValue: price,
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
