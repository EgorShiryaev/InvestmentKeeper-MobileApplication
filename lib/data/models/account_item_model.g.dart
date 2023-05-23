// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountItemModel _$AccountItemModelFromJson(Map<String, dynamic> json) =>
    AccountItemModel(
      id: json['id'] as int,
      lots: json['lots'] as int,
      averagePurchasePrice: (json['averagePurchasePrice'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      instrument:
          Instrument.fromJson(json['instrument'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountItemModelToJson(AccountItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lots': instance.lots,
      'averagePurchasePrice': instance.averagePurchasePrice,
      'currentPrice': instance.currentPrice,
      'instrument': instance.instrument,
    };
