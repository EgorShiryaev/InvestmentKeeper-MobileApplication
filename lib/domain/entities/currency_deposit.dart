// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'currency.dart';

part 'currency_deposit.g.dart';

@JsonSerializable()
class CurrencyDeposit {
  final Currency currency;
  final double value;

  CurrencyDeposit({
    required this.currency,
    required this.value,
  });

  factory CurrencyDeposit.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDepositFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyDepositToJson(this);
}
