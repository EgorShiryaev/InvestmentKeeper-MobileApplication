import '../../domain/entities/currency.dart';
import 'double_to_string.dart';
import 'get_currency_char.dart';

String getPriceWithCurrency(double price, Currency currency) {
  final currencyChar = getCurrencyChar(currency);
  return '${doubleToString(price)} $currencyChar';
}
