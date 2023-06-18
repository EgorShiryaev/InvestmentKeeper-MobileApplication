import '../../../domain/entities/currency.dart';

String currencyToJson(Currency currency) {
  switch (currency) {
    case Currency.rub:
      return 'RUB';
  }
}
