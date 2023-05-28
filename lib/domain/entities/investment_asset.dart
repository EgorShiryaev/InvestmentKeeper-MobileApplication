// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/instrument.dart';

part 'investment_asset.g.dart';

@JsonSerializable()
class InvestmentAsset {
  final int id;
  final int lots;
  final double averagePurchasePrice;
  final double currentPrice;
  final Instrument instrument;
  final int totalLots;
  final double? totalCurrentPrice;
  final double? profit;
  final double? profitPercent;

  InvestmentAsset({
    required this.id,
    required this.lots,
    required this.averagePurchasePrice,
    required this.currentPrice,
    required this.instrument,
    required this.totalLots,
    this.totalCurrentPrice,
    this.profit,
    this.profitPercent,
  });

  factory InvestmentAsset.fromJson(Map<String, dynamic> json) =>
      _$InvestmentAssetFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentAssetToJson(this);
}
