import '../../../domain/entities/investment_asset.dart';
import '../../../domain/entities/money.dart';

class CurrentPurchasePrice {
  final Money current;
  final Money purchase;

  CurrentPurchasePrice({
    required this.current,
    required this.purchase,
  });
}

CurrentPurchasePrice countCurrentPurchasePrice(List<InvestmentAsset> items) {
  int currentPriceUnits = 0;
  int currentPriceNano = 0;
  int purchasePriceUnits = 0;
  int purchasePriceNano = 0;

  for (final item in items) {
    currentPriceNano += item.totalCurrentPrice.nano;
    if (currentPriceNano > NANO_VALUE) {
      currentPriceUnits++;
      currentPriceNano %= NANO_VALUE;
    }
    currentPriceUnits += item.totalCurrentPrice.units;
    purchasePriceNano += item.totalPurchasePrice.nano;
    if (purchasePriceNano > NANO_VALUE) {
      purchasePriceUnits++;
      purchasePriceNano %= NANO_VALUE;
    }
    purchasePriceUnits += item.totalPurchasePrice.units;
  }

  final current = Money(units: currentPriceUnits, nano: currentPriceNano);
  final purchase = Money(units: purchasePriceUnits, nano: purchasePriceNano);

  return CurrentPurchasePrice(
    current: current,
    purchase: purchase,
  );
}
