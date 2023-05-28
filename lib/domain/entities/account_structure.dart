import 'currency_deposit.dart';
import 'instrument_type.dart';
import 'investment_asset.dart';

class AccountStructure {
  final List<InvestmentAsset> stocks;
  final List<InvestmentAsset> bonds;
  final List<InvestmentAsset> etfs;
  final List<InvestmentAsset> futures;
  final List<CurrencyDeposit> currencies;

  AccountStructure({
    required this.stocks,
    required this.bonds,
    required this.etfs,
    required this.futures,
    required this.currencies,
  });

  factory AccountStructure.fromAccountItems(
    List<InvestmentAsset> items,
    List<CurrencyDeposit> currencyDeposits,
  ) {
    final stocks = <InvestmentAsset>[];
    final bonds = <InvestmentAsset>[];
    final etfs = <InvestmentAsset>[];
    final futures = <InvestmentAsset>[];

    for (final element in items) {
      if (element.instrument.type == InstrumentType.stock) {
        stocks.add(element);
      } else if (element.instrument.type == InstrumentType.bond) {
        bonds.add(element);
      } else if (element.instrument.type == InstrumentType.etf) {
        etfs.add(element);
      } else if (element.instrument.type == InstrumentType.future) {
        futures.add(element);
      }
    }

    return AccountStructure(
      stocks: stocks,
      bonds: bonds,
      etfs: etfs,
      futures: futures,
      currencies: currencyDeposits,
    );
  }
}
