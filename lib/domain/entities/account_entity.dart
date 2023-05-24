import '../../data/models/account_model.dart';
import 'account_structure.dart';

class AccountEntity extends AccountModel {
  late final AccountStructure structure;

  AccountEntity({
    required super.id,
    required super.title,
    required super.balance,
    required super.purchasePrice,
    required super.currentPrice,
    required super.profit,
    required super.profitPercent,
    required super.items,
  }) {
    structure = AccountStructure.fromAccountItems(items);
  }

  factory AccountEntity.fromModel(AccountModel model) {
    return AccountEntity(
      id: model.id,
      title: model.title,
      balance: model.balance,
      purchasePrice: model.purchasePrice,
      currentPrice: model.currentPrice,
      profit: model.profit,
      profitPercent: model.profitPercent,
      items: model.items,
    );
  }

  factory AccountEntity.fromJson(Map<String, dynamic> json) {
    final model = AccountModel.fromJson(json);
    return AccountEntity.fromModel(model);
  }
}
