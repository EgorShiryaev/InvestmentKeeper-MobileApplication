import 'account_item_entity.dart';
import 'instrument_type.dart';

class AccountStructure {
  final List<AccountItemEntity> stocks;
  final List<AccountItemEntity> bonds;
  final List<AccountItemEntity> etfs;
  final List<AccountItemEntity> futures;

  AccountStructure({
    required this.stocks,
    required this.bonds,
    required this.etfs,
    required this.futures,
  });

  factory AccountStructure.fromAccountItems(List<AccountItemEntity> items) {
    final stocks = <AccountItemEntity>[];
    final bonds = <AccountItemEntity>[];
    final etfs = <AccountItemEntity>[];
    final futures = <AccountItemEntity>[];

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
    );
  }

  factory AccountStructure.empty() {
    return AccountStructure(stocks: [], bonds: [], etfs: [], futures: []);
  }
}
