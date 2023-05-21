// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountItem _$AccountItemFromJson(Map<String, dynamic> json) => AccountItem(
      id: json['id'] as int,
      lots: json['lots'] as int,
      averagePurchasePrice: (json['averagePurchasePrice'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      instrument:
          Instrument.fromJson(json['instrument'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountItemToJson(AccountItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lots': instance.lots,
      'averagePurchasePrice': instance.averagePurchasePrice,
      'currentPrice': instance.currentPrice,
      'instrument': instance.instrument,
    };
