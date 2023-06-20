import 'currency.dart';
import 'money.dart';

class CurrencyDeposit {
  final Currency currency;
  final Money value;
  late final num valueNum;

  CurrencyDeposit({
    required this.currency,
    required this.value,
  }) {
    valueNum = value.toNum();
  }

  factory CurrencyDeposit.fromJson(Map<String, dynamic> json) {
    return CurrencyDeposit(
      currency: currenciesMap[json['currency']]!,
      value: Money.fromJson(json['value']),
    );
  }
}
