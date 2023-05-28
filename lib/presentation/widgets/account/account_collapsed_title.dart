import 'package:flutter/material.dart';

import '../../../core/utils/get_price_with_currency.dart';
import '../../../domain/entities/account_entity.dart';
import '../profit_widget.dart';

class AccountCollapsedTitle extends StatelessWidget {
  final AccountEntity account;
  const AccountCollapsedTitle({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getPriceWithCurrency(
            account.currentPrice + account.mainCurrencyDeposite.value,
            account.mainCurrencyDeposite.currency,
          ),
          style: titleStyle,
        ),
        ProfitWidget(
          profit: account.profit,
          profitPercent: account.profitPercent,
          currency: account.mainCurrencyDeposite.currency,
        )
      ],
    );
  }
}
