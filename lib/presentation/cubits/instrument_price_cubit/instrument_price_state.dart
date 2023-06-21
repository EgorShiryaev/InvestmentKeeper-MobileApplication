
import '../error_cubit_state.dart';

abstract class InstrumentPriceState {}

class InitialInstrumentPriceState extends InstrumentPriceState {}

class LoadingInstrumentPriceState extends InstrumentPriceState {}

class LoadedInstrumentPriceState extends InstrumentPriceState {
  final num price;

  LoadedInstrumentPriceState({required this.price});
}

class ErrorInstrumentPriceState extends ErrorState
    implements InstrumentPriceState {
  ErrorInstrumentPriceState({required super.message});
}
