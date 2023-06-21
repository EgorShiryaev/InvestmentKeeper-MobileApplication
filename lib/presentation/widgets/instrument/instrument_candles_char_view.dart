import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/utils/currency_utils/get_currency_char.dart';
import '../../../domain/entities/candle.dart';
import '../../pages/arguments/instrument_page_arguments.dart';
import 'candle_chart_legend_view.dart';

class InstrumentCandlesCharView extends StatelessWidget {
  final List<Candle> candles;
  final DateFormat dateFormat;
  const InstrumentCandlesCharView({
    super.key,
    required this.candles,
    required this.dateFormat,
  });

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as InstrumentPageArguments;
    final instrument = args.asset.instrument;
    final currencyChar = getCurrencyChar(instrument.currency);
    return SfCartesianChart(
      enableAxisAnimation: false,
      trackballBehavior: TrackballBehavior(
        activationMode: ActivationMode.singleTap,
        tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
        enable: true,
        builder: (context, trackballDetails) {
          final info = trackballDetails.groupingModeInfo!.points[0];
          return CandleChartLegendView(info: info);
        },
      ),
      series: [
        CandleSeries<Candle, DateTime>(
          dataSource: candles,
          xValueMapper: (candle, _) => candle.time,
          lowValueMapper: (candle, _) => candle.low,
          highValueMapper: (candle, _) => candle.high,
          openValueMapper: (candle, _) => candle.open,
          closeValueMapper: (candle, _) => candle.close,
        )
      ],
      primaryXAxis: DateTimeAxis(
        interval: 1,
        dateFormat: dateFormat,
        majorGridLines: const MajorGridLines(width: 1),
      ),
      primaryYAxis: NumericAxis(
        numberFormat: NumberFormat.currency(
          locale: 'ru',
          symbol: currencyChar,
        ),
      ),
    );
  }
}
