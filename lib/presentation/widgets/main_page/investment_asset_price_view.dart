import 'package:flutter/material.dart';

import '../../../domain/entities/currency.dart';
import '../money_widget.dart';

class InvestmentAssetPriceView extends StatelessWidget {
  final num price;
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
      value: price,
      currency: currency,
      textStyle: priceStyle,
    );
  }
}
