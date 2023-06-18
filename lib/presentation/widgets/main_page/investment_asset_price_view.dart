import 'package:flutter/material.dart';

import '../../../domain/entities/currency.dart';
import '../money_widget.dart';

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
    final priceStyle = Theme.of(context).textTheme.titleMedium!;
    return MoneyWidget(
      moneyValue: price,
      currency: currency,
      textStyle: priceStyle,
    );
  }
}
