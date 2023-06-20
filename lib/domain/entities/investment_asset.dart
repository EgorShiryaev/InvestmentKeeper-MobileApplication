import '../../core/utils/round_percent.dart';
import 'instrument.dart';
import 'money.dart';

class InvestmentAsset {
  final int id;
  final int lots;
  final Money averagePurchasePrice;
  final Money currentPrice;
  final Instrument instrument;

  late final int totalLots;
  late final num profit;
  late final double profitPercent;
  late final num averagePurchasePriceNum;
  late final num currentPriceNum;
  late final num totalCurrentPriceNum;
  late final num totalPurchasePriceNum;

  late final Money totalCurrentPrice;
  late final Money totalPurchasePrice;

  InvestmentAsset({
    required this.id,
    required this.lots,
    required this.averagePurchasePrice,
    required this.currentPrice,
    required this.instrument,
  }) {
    totalLots = lots * instrument.lot;
    totalCurrentPrice = currentPrice.multiply(totalLots);
    totalPurchasePrice = averagePurchasePrice.multiply(totalLots);
    profit = totalCurrentPrice.subtraction(totalPurchasePrice).toNum();

    totalPurchasePriceNum = totalPurchasePrice.toNum();
    profitPercent = totalPurchasePriceNum == 0
        ? 0
        : roundPercent(profit / totalPurchasePriceNum);
    totalCurrentPriceNum = totalCurrentPrice.toNum();

    averagePurchasePriceNum = averagePurchasePrice.toNum();
    currentPriceNum = currentPrice.toNum();
  }

  factory InvestmentAsset.fromJson(Map<String, dynamic> json) {
    return InvestmentAsset(
      id: json['id'],
      lots: json['lots'],
      averagePurchasePrice: Money.fromJson(json['averagePurchasePrice']),
      currentPrice: Money.fromJson(json['currentPrice']),
      instrument: Instrument.fromJson(
        json['instrument'] as Map<String, dynamic>,
      ),
    );
  }
}
