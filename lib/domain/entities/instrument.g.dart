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
    );

Map<String, dynamic> _$InstrumentToJson(Instrument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'figi': instance.figi,
      'ticker': instance.ticker,
      'title': instance.title,
      'lot': instance.lot,
      'type': _$InstrumentTypeEnumMap[instance.type]!,
    };

const _$InstrumentTypeEnumMap = {
  InstrumentType.stock: 'stock',
};
