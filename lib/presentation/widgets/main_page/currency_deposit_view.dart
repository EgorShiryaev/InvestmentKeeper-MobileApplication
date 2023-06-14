import 'package:flutter/material.dart';

import '../../../core/utils/currency_utils/get_currency_title.dart';
import '../../../domain/entities/currency_deposit.dart';
import 'investment_asset_price_view.dart';

class CurrencyDepositView extends StatelessWidget {
  final CurrencyDeposit currencyDeposit;
  const CurrencyDepositView({super.key, required this.currencyDeposit});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final title = getCurrencyTitle(currencyDeposit.currency);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: titleStyle),
        InvestmentAssetPriceView(
          currency: currencyDeposit.currency,
          price: currencyDeposit.value,
        ),
      ],
    );
  }
}
