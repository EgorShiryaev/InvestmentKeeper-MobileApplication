// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import '../../core/utils/round_percent.dart';
import '../../domain/entities/instrument.dart';

part 'investment_asset.g.dart';

@JsonSerializable()
class InvestmentAsset {
  final int id;
  final int lots;
  final double averagePurchasePrice;
  final double currentPrice;
  final Instrument instrument;

  late final double profit;
  late final double profitPercent;
  late final int totalLots;
  late final double totalCurrentPrice;

  InvestmentAsset({
    required this.id,
    required this.lots,
    required this.averagePurchasePrice,
    required this.currentPrice,
    required this.instrument,
  }) {
    totalLots = lots * instrument.lot;
    profit = (currentPrice - averagePurchasePrice) * totalLots;
    profitPercent = roundPercent(profit / (averagePurchasePrice * totalLots));
    totalCurrentPrice = currentPrice * totalLots;
  }

  factory InvestmentAsset.fromJson(Map<String, dynamic> json) =>
      _$InvestmentAssetFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentAssetToJson(this);
}
