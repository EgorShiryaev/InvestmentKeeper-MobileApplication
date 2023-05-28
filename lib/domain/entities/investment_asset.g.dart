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
      instrument:
          Instrument.fromJson(json['instrument'] as Map<String, dynamic>),
      totalLots: json['totalLots'] as int,
      totalCurrentPrice: (json['totalCurrentPrice'] as num?)?.toDouble(),
      profit: (json['profit'] as num?)?.toDouble(),
      profitPercent: (json['profitPercent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InvestmentAssetToJson(InvestmentAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lots': instance.lots,
      'averagePurchasePrice': instance.averagePurchasePrice,
      'currentPrice': instance.currentPrice,
      'instrument': instance.instrument,
      'totalLots': instance.totalLots,
      'totalCurrentPrice': instance.totalCurrentPrice,
      'profit': instance.profit,
      'profitPercent': instance.profitPercent,
    };
