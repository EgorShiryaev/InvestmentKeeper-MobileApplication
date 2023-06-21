import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/utils/currency_utils/get_currency_char.dart';
import '../../../domain/entities/candle.dart';
import '../../../domain/entities/candle_chart_size.dart';
import '../../cubits/candles_cubit/candles_cubit.dart';
import '../../cubits/candles_cubit/candles_state.dart';
import '../../pages/arguments/create_purchase_page_arguments.dart';
import '../../pages/arguments/create_sale_page_arguments.dart';
import '../../pages/arguments/instrument_page_arguments.dart';
import '../../pages/create_purchase_page.dart';
import '../../pages/create_sale_page.dart';
import '../../themes/app_theme.dart';
import '../loading_mask.dart';
import 'candle_chart_legend_view.dart';
import 'chart_size_selector.dart';

const locale = 'ru';

class InstrumentPageBody extends HookWidget {
  const InstrumentPageBody({super.key});

  DateFormat getDateFormatOfCharSize(CandleChartSize size) {
    switch (size) {
      case CandleChartSize.day:
        return DateFormat.Hm(locale);
      case CandleChartSize.threeDays:
        return DateFormat.Hm(locale);
      case CandleChartSize.week:
        return DateFormat.Hm(locale);
      case CandleChartSize.month:
        return DateFormat.Md(locale);
      case CandleChartSize.sixMonth:
        return DateFormat.yMd(locale);
      case CandleChartSize.year:
        return DateFormat.yM(locale);
    }
  }

  void navigateToCreateSalePage() {
    final args = Get.arguments as InstrumentPageArguments;
    Get.toNamed(
      CreateSalePage.routeName,
      arguments: CreateSalePageArguments(
        account: args.account,
        instrument: args.asset.instrument,
      ),
    );
  }

  void navigateToCreatePurchasePage() {
    final args = Get.arguments as InstrumentPageArguments;
    Get.toNamed(
      CreatePurchasePage.routeName,
      arguments: CreatePurchasePageArguments(
        account: args.account,
        instrument: args.asset.instrument,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as InstrumentPageArguments;
    final instrument = args.asset.instrument;
    final isLoadingState = useState(true);
    final candlesState = useState(<Candle>[]);
    final selectedCharSize = useState(CandleChartSize.day);
    final dateFormatState = useState(DateFormat.Hm(locale));

    useEffect(
      () {
        initializeDateFormatting();
        return null;
      },
      [],
    );

    useEffect(
      () {
        dateFormatState.value = getDateFormatOfCharSize(selectedCharSize.value);
        return null;
      },
      [selectedCharSize.value],
    );

    useEffect(
      () {
        final args = Get.arguments as InstrumentPageArguments;
        final instrument = args.asset.instrument;
        BlocProvider.of<CandlesCubit>(context).load(
          instrumentId: instrument.id,
          size: selectedCharSize.value,
        );
        return null;
      },
      [selectedCharSize.value],
    );

    final currencyChar = getCurrencyChar(instrument.currency);
    return BlocListener<CandlesCubit, CandlesState>(
      listener: (context, state) {
        isLoadingState.value = state is LoadingCandlesState;
        if (state is LoadedCandlesState) {
          candlesState.value = state.candles;
        }
      },
      child: Column(
        children: [
          Stack(
            children: [
              SfCartesianChart(
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
                    dataSource: candlesState.value,
                    xValueMapper: (candle, _) => candle.time,
                    lowValueMapper: (candle, _) => candle.low,
                    highValueMapper: (candle, _) => candle.high,
                    openValueMapper: (candle, _) => candle.open,
                    closeValueMapper: (candle, _) => candle.close,
                  )
                ],
                primaryXAxis: DateTimeAxis(
                  interval: 1,
                  dateFormat: dateFormatState.value,
                  majorGridLines: const MajorGridLines(width: 1),
                ),
                primaryYAxis: NumericAxis(
                  numberFormat: NumberFormat.currency(
                    locale: 'ru',
                    symbol: currencyChar,
                  ),
                ),
              ),
              if (isLoadingState.value) const LoadingMask(isVisibility: true)
            ],
          ),
          ChartSizeSelector(selectedValue: selectedCharSize),
          Padding(
            padding: AppTheme.horizontalPagePadding.copyWith(top: 16),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: navigateToCreateSalePage,
                    child: const Text('Продать'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.tonal(
                    onPressed: navigateToCreatePurchasePage,
                    child: const Text('Купить'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
