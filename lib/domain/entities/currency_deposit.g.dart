// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_deposit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyDeposit _$CurrencyDepositFromJson(Map<String, dynamic> json) =>
    CurrencyDeposit(
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrencyDepositToJson(CurrencyDeposit instance) =>
    <String, dynamic>{
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'value': instance.value,
    };

const _$CurrencyEnumMap = {
  Currency.rub: 'RUB',
};
