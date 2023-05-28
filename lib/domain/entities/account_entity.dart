import '../../data/models/account_model.dart';
import 'account_structure.dart';
import 'currency.dart';
import 'currency_deposit.dart';

class AccountEntity extends AccountModel {
  late final AccountStructure structure;
  late final CurrencyDeposit mainCurrencyDeposite;

  AccountEntity({
    required super.id,
    required super.title,
    required super.purchasePrice,
    required super.currentPrice,
    required super.profit,
    required super.profitPercent,
    required super.items,
    required super.currencyDeposits,
  }) {
    structure = AccountStructure.fromAccountItems(items, currencyDeposits);
    mainCurrencyDeposite = currencyDeposits.firstWhere(
      (element) => element.currency == Currency.rub,
    );
  }

  factory AccountEntity.fromModel(AccountModel model) {
    return AccountEntity(
      id: model.id,
      title: model.title,
      purchasePrice: model.purchasePrice,
      currentPrice: model.currentPrice,
      profit: model.profit,
      profitPercent: model.profitPercent,
      items: model.items,
      currencyDeposits: model.currencyDeposits,
    );
  }

  factory AccountEntity.fromJson(Map<String, dynamic> json) {
    final model = AccountModel.fromJson(json);
    return AccountEntity.fromModel(model);
  }
}
