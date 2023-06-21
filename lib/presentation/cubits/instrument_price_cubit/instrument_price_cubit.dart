import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/utils/get_error_message.dart';
import '../../../data/datasources/instrument_price_datasource/instrument_price_datasource.dart';
import '../../pages/arguments/instrument_page_arguments.dart';
import 'instrument_price_state.dart';

class InstrumentPriceCubit extends Cubit<InstrumentPriceState> {
  final InstrumentPriceDatasource _datasource;
  late Timer _timer;

  InstrumentPriceCubit({required InstrumentPriceDatasource datasource})
      : _datasource = datasource,
        super(InitialInstrumentPriceState());

  void subscribeToPrice() {
    final args = Get.arguments as InstrumentPageArguments;
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (isClosed) {
        unsubscrubeToPrice();
        return;
      }
      _datasource.get(args.asset.instrument.id).then((value) {
        emit(LoadedInstrumentPriceState(price: value.toNum()));
      }).catchError((error) {
        final message = getErrorMessage(error);
        emit(ErrorInstrumentPriceState(message: message));
      });
    });
  }

  void unsubscrubeToPrice() {
    _timer.cancel();
  }
}
