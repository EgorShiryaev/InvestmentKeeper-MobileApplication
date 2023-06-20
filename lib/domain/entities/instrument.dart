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
    return Instrument(
      id: json['id'],
      figi: json['figi'],
      ticker: json['ticker'],
      title: json['title'],
      lot: json['lot'],
      type: instrumentTypesMap[json['type']]!,
      currency: currenciesMap[json['currency']]!,
    );
  }
}
