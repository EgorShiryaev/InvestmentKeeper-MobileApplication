import '../../../domain/entities/instrument.dart';
import '../error_cubit_state.dart';

abstract class SearchInstrumentState {}

class InitialSearchInstrumentState extends SearchInstrumentState {}

class LoadingSearchInstrumentState extends SearchInstrumentState {}

class LoadedSearchInstrumentState extends SearchInstrumentState {
  final List<Instrument> instruments;

  LoadedSearchInstrumentState({required this.instruments});
}

class EmptySearchInstrumentState extends SearchInstrumentState {}

class ErrorSearchInstrumentState extends ErrorCubitState
    implements SearchInstrumentState {
  ErrorSearchInstrumentState({required super.message});
}
