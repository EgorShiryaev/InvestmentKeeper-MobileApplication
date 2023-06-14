import 'package:flutter/material.dart';

import '../../../core/utils/get_currency_char.dart';
import '../../../domain/entities/currency.dart';

class InvestmentAssetPriceView extends StatelessWidget {
  final double price;
  final Currency currency;

  const InvestmentAssetPriceView({
    super.key,
    required this.price,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    final priceStyle = Theme.of(context).textTheme.titleMedium;
    final currencyChar = getCurrencyChar(currency);
    return Text(
      '$price $currencyChar',
      style: priceStyle,
    );
  }
}
