import 'package:flutter/material.dart';

import '../../core/utils/currency_utils/get_currency_char.dart';
import '../../domain/entities/currency.dart';

class MoneyWidget extends StatelessWidget {
  final num value;
  final Currency currency;
  final TextStyle? textStyle;
  const MoneyWidget({
    super.key,
    required this.value,
    required this.currency,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final currencyChar = getCurrencyChar(currency);

    return Text(
      '$value $currencyChar',
      style: textStyle,
    );
  }
}
