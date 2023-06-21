import '../../core/utils/remove_priv_stock_suffix.dart';
import 'currency.dart';
import 'instrument_type.dart';

class Instrument {
  final int id;
  final String figi;
  final String ticker;
  final String title;
  final int lot;
  final InstrumentType type;
  final Currency currency;

  Instrument({
    required this.id,
    required this.figi,
    required this.ticker,
    required this.title,
    required this.lot,
    required this.type,
    required this.currency,
  });

  factory Instrument.fromJson(Map<String, dynamic> json) {
    final title = removePrivStockSuffix(json['title'] as String);
    return Instrument(
      id: json['id'],
      figi: json['figi'],
      ticker: json['ticker'],
      title: title,
      lot: json['lot'],
      type: instrumentTypesMap[json['type']]!,
      currency: currenciesMap[json['currency']]!,
    );
  }
}
