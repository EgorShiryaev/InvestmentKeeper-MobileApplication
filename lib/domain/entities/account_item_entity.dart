import '../../data/models/account_item_model.dart';

class AccountItemEntity extends AccountItemModel {
  late final int totalLots;
  late final double totalCurrentPrice;
  late final double totalAveragePrice;
  late final double profit;
  late final double profitPercent;

  AccountItemEntity({
    required super.id,
    required super.lots,
    required super.averagePurchasePrice,
    required super.currentPrice,
    required super.instrument,
  }) {
    totalLots = lots * instrument.lot;
    totalCurrentPrice = currentPrice * totalLots;
    totalAveragePrice = averagePurchasePrice * totalLots;
    profit = totalCurrentPrice - totalAveragePrice;
    profitPercent = (-1 + totalCurrentPrice / totalAveragePrice) * 100;
  }

  factory AccountItemEntity.fromModel(AccountItemModel model) {
    return AccountItemEntity(
      id: model.id,
      lots: model.lots,
      averagePurchasePrice: model.averagePurchasePrice,
      currentPrice: model.currentPrice,
      instrument: model.instrument,
    );
  }

  factory AccountItemEntity.fromJson(Map<String, dynamic> json) {
    final model = AccountItemModel.fromJson(json);
    return AccountItemEntity.fromModel(model);
  }

  
}
