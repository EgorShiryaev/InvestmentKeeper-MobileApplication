import 'package:flutter/material.dart';

import '../../../core/utils/get_currency_char.dart';
import '../../../domain/entities/account_entity.dart';
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
    final currencyChar = getCurrencyChar(account.currency);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$price $currencyChar', style: titleStyle),
        ProfitWidget(
          profit: account.profit,
          profitPercent: account.profitPercent,
          currency: account.currency,
        )
      ],
    );
  }
}
