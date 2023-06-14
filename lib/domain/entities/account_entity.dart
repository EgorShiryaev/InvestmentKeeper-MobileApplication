import '../../core/utils/round_percent.dart';
import '../../data/models/account_model.dart';
import 'account_structure.dart';
import 'currency_deposit.dart';

class AccountEntity extends AccountModel {
  late final double profit;
  late final double profitPercent;
  late final AccountStructure structure;
  late final CurrencyDeposit mainCurrencyDeposit;

  AccountEntity({
    required super.id,
    required super.title,
    required super.purchasePrice,
    required super.currentPrice,
    required super.items,
    required super.currencyDeposits,
    required super.currency,
  }) {
    profit = purchasePrice - currentPrice;
    profitPercent = roundPercent(profit / purchasePrice);
    structure = AccountStructure.fromAccountItems(items, currencyDeposits);
    mainCurrencyDeposit = currencyDeposits.firstWhere(
      (element) => element.currency == currency,
    );
  }

  factory AccountEntity.fromModel(AccountModel model) {
    return AccountEntity(
      id: model.id,
      title: model.title,
      purchasePrice: model.purchasePrice,
      currentPrice: model.currentPrice,
      items: model.items,
      currencyDeposits: model.currencyDeposits,
      currency: model.currency,
    );
  }

  factory AccountEntity.fromJson(Map<String, dynamic> json) {
    final model = AccountModel.fromJson(json);
    return AccountEntity.fromModel(model);
  }
}
