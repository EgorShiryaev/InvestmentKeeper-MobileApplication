// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentAsset _$InvestmentAssetFromJson(Map<String, dynamic> json) =>
    InvestmentAsset(
      id: json['id'] as int,
      lots: json['lots'] as int,
      averagePurchasePrice: (json['averagePurchasePrice'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      instrument: Instrument.fromJson(
        json['instrument'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$InvestmentAssetToJson(InvestmentAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lots': instance.lots,
      'averagePurchasePrice': instance.averagePurchasePrice,
      'currentPrice': instance.currentPrice,
      'instrument': instance.instrument,
      'profit': instance.profit,
      'profitPercent': instance.profitPercent,
      'totalLots': instance.totalLots,
      'totalCurrentPrice': instance.totalCurrentPrice,
    };
