import '../../../domain/entities/candle.dart';
import '../error_cubit_state.dart';

abstract class CandlesState {}

class InitialCandlesState extends CandlesState {}

class LoadingCandlesState extends CandlesState {}

class LoadedCandlesState extends CandlesState {
  final List<Candle> candles;

  LoadedCandlesState({required this.candles});
}

class ErrorCandlesState extends ErrorState implements CandlesState {
  ErrorCandlesState({required super.message});
}
