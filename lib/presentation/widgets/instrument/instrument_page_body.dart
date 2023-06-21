import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/candle.dart';
import '../../../domain/entities/candle_chart_size.dart';
import '../../cubits/candles_cubit/candles_cubit.dart';
import '../../cubits/candles_cubit/candles_state.dart';
import '../../pages/arguments/instrument_page_arguments.dart';
import '../loading_mask.dart';
import 'chart_size_selector.dart';
import 'instrument_button_bar.dart';
import 'instrument_candles_char_view.dart';

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

  @override
  Widget build(BuildContext context) {
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
              InstrumentCandlesCharView(
                candles: candlesState.value,
                dateFormat: dateFormatState.value,
              ),
              if (isLoadingState.value) const LoadingMask(isVisibility: true)
            ],
          ),
          ChartSizeSelector(selectedValue: selectedCharSize),
          const InstrumentButtonBar()
        ],
      ),
    );
  }
}
