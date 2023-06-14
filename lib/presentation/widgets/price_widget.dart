import 'package:flutter/material.dart';

import '../../core/utils/get_currency_char.dart';
import '../../domain/entities/currency.dart';

class PriceWidget extends StatelessWidget {
  final double price;
  final Currency currency;
  final TextStyle textStyle;
  const PriceWidget({
    super.key,
    required this.price,
    required this.currency,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final currencyChar = getCurrencyChar(currency);
    return Text(
      '$price $currencyChar',
      style: textStyle,
    );
  }
}
