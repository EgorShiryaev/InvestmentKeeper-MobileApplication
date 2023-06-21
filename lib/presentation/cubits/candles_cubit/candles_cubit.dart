import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/get_error_message.dart';
import '../../../domain/entities/candle_chart_size.dart';
import '../../../domain/usecase/get_candles_usecase.dart';
import 'candles_state.dart';

class CandlesCubit extends Cubit<CandlesState> {
  final GetCandlesUsecase _usecase;
  CandlesCubit({required GetCandlesUsecase usecase})
      : _usecase = usecase,
        super(InitialCandlesState());

  Future<void> load({
    required int instrumentId,
    required CandleChartSize size,
  }) async {
    try {
      emit(LoadingCandlesState());
      final candles = await _usecase(
        chartSize: size,
        instrumentId: instrumentId,
      );
      emit(LoadedCandlesState(candles: candles));
    } catch (error) {
      final message = getErrorMessage(error);
      emit(FailureCandlesState(message: message));
    }
  }
}
