import '../../core/utils/calculator/count_current_purchase_price.dart';
import '../../core/utils/round_percent.dart';
import 'account_structure.dart';
import 'currency.dart';
import 'currency_deposit.dart';
import 'investment_asset.dart';

class Account {
  final int id;
  final String title;
  final List<InvestmentAsset> items;
  final List<CurrencyDeposit> currencyDeposits;
  final Currency currency;

  late final num profit;
  late final double profitPercent;
  late final AccountStructure structure;
  late final CurrencyDeposit mainCurrencyDeposit;
  late final num purchasePrice;
  late final num currentPrice;
  late final num totalMoneyValue;

  Account({
    required this.id,
    required this.title,
    required this.items,
    required this.currencyDeposits,
    this.currency = Currency.rub,
  }) {
    final price = countCurrentPurchasePrice(items);
    currentPrice = price.current.toNum();
    purchasePrice = price.purchase.toNum();
    profit = price.current.subtraction(price.purchase).toNum();
    profitPercent =
        purchasePrice == 0 ? 0 : roundPercent(profit / purchasePrice);
    structure = AccountStructure.fromAccountItems(items, currencyDeposits);
    mainCurrencyDeposit = currencyDeposits.firstWhere(
      (element) => element.currency == currency,
    );
    totalMoneyValue = price.current.summ(mainCurrencyDeposit.value).toNum();
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      title: json['title'],
      items: (json['items'] as List<dynamic>)
          .map((e) => InvestmentAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
      currencyDeposits: (json['currencyDeposits'] as List<dynamic>)
          .map((e) => CurrencyDeposit.fromJson(e as Map<String, dynamic>))
          .toList(),
      currency: Currency.rub,
    );
  }
}
