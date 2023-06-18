import '../../../domain/entities/currency.dart';

String getCurrencyChar(Currency currency) {
  switch (currency) {
    case Currency.rub:
      return '₽';
  }
}
