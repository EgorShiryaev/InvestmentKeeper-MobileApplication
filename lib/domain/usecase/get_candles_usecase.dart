import '../../data/datasources/candles_datasource/candles_datasource.dart';
import '../entities/candle.dart';
import '../entities/candle_chart_size.dart';
import '../entities/candle_timesize.dart';

class GetCandlesUsecase {
  final CandlesDatasource _datasource;

  GetCandlesUsecase({required CandlesDatasource datasource})
      : _datasource = datasource;

  Duration _getDuration(CandleChartSize chartSize) {
    switch (chartSize) {
      case CandleChartSize.day:
        return const Duration(days: 1);
      case CandleChartSize.threeDays:
        return const Duration(days: 3);
      case CandleChartSize.week:
        return const Duration(days: 7);
      case CandleChartSize.month:
        return const Duration(days: 30);
      case CandleChartSize.sixMonth:
        return const Duration(days: 180);
      case CandleChartSize.year:
        return const Duration(days: 365);
    }
  }

  DateTime _getFromDate({
    required CandleChartSize chartSize,
    required DateTime to,
  }) {
    final offsetDuration = _getDuration(chartSize);
    return DateTime(to.year, to.month, to.day).subtract(offsetDuration);
  }

  CandleTimesize _getCandleTimesize(CandleChartSize chartSize) {
    switch (chartSize) {
      case CandleChartSize.day:
        return CandleTimesize.hour;
      case CandleChartSize.threeDays:
        return CandleTimesize.twoHours;
      case CandleChartSize.week:
        return CandleTimesize.fourHours;
      case CandleChartSize.month:
        return CandleTimesize.day;
      case CandleChartSize.sixMonth:
        return CandleTimesize.week;
      case CandleChartSize.year:
        return CandleTimesize.month;
    }
  }

  Future<List<Candle>> call({
    required int instrumentId,
    required CandleChartSize chartSize,
  }) {
    final now = DateTime.now();
    final to = DateTime(now.year, now.month, now.day);
    final from = _getFromDate(chartSize: chartSize, to: to);
    final candLeTimesize = _getCandleTimesize(chartSize);

    return _datasource.get(
      instrumentId: instrumentId,
      candleTimesize: candLeTimesize,
      from: from,
      to: to,
    );
  }
}
