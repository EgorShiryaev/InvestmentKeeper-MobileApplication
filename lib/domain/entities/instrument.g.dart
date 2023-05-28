// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instrument.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Instrument _$InstrumentFromJson(Map<String, dynamic> json) => Instrument(
      id: json['id'] as int,
      figi: json['figi'] as String,
      ticker: json['ticker'] as String,
      title: json['title'] as String,
      lot: json['lot'] as int,
      type: $enumDecode(_$InstrumentTypeEnumMap, json['type']),
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
    );

Map<String, dynamic> _$InstrumentToJson(Instrument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'figi': instance.figi,
      'ticker': instance.ticker,
      'title': instance.title,
      'lot': instance.lot,
      'type': _$InstrumentTypeEnumMap[instance.type]!,
      'currency': _$CurrencyEnumMap[instance.currency]!,
    };

const _$InstrumentTypeEnumMap = {
  InstrumentType.stock: 'stock',
  InstrumentType.bond: 'bond',
  InstrumentType.etf: 'etf',
  InstrumentType.future: 'future',
};

const _$CurrencyEnumMap = {
  Currency.rub: 'RUB',
};
