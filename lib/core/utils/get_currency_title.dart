import '../../domain/entities/currency.dart';

String getCurrencyTitle(Currency currency) {
  switch (currency) {
    case Currency.rub:
      return 'Рубль';
  }
}
