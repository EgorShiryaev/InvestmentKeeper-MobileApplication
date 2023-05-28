// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'currency.dart';
import 'instrument_type.dart';

part 'instrument.g.dart';

@JsonSerializable()
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

  factory Instrument.fromJson(Map<String, dynamic> json) =>
      _$InstrumentFromJson(json);

  Map<String, dynamic> toJson() => _$InstrumentToJson(this);
}
