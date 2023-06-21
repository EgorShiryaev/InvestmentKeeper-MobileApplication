import '../../../domain/entities/candle.dart';
import '../../../domain/entities/candle_timesize.dart';

abstract class CandlesDatasource {
  Future<List<Candle>> get({
    required int instrumentId,
    required CandleTimesize candleTimesize,
    required DateTime from,
    required DateTime to,
  });
}
