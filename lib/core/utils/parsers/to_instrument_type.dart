import '../../../domain/entities/instrument_type.dart';

InstrumentType toInstrumentType(String value) {
  switch (value) {
    case 'stock':
      return InstrumentType.stock;
  }
  return InstrumentType.stock;
}
