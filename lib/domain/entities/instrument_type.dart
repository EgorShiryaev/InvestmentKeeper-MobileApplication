// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

enum InstrumentType {
  @JsonValue('stock')
  stock,
  @JsonValue('bond')
  bond,
  @JsonValue('etf')
  etf,
  @JsonValue('future')
  future,
}
