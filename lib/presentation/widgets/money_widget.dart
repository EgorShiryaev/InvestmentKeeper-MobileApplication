import 'package:flutter/material.dart';

import '../../core/utils/currency_utils/get_currency_char.dart';
import '../../core/utils/get_money_value_text.dart';
import '../../domain/entities/currency.dart';

class MoneyWidget extends StatelessWidget {
  final double moneyValue;
  final Currency currency;
  final TextStyle? textStyle;
  const MoneyWidget({
    super.key,
    required this.moneyValue,
    required this.currency,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final currencyChar = getCurrencyChar(currency);
    final moneyText = getMoneyValueText(moneyValue);
    return Text(
      '$moneyText $currencyChar',
      style: textStyle,
    );
  }
}
