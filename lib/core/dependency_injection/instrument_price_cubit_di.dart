import 'package:get/get.dart';

import '../../data/datasources/instrument_price_datasource/instrument_price_datasource.dart';
import '../../data/datasources/instrument_price_datasource/instrument_price_remote_datasource.dart';
import '../../presentation/cubits/instrument_price_cubit/instrument_price_cubit.dart';

void instrumentPriceCubitDependencyInjection() {
  Get
    ..create<InstrumentPriceDatasource>(
      () => InstrumentPriceRemoteDatasource(requestManager: Get.find()),
    )
    ..lazyPut(
      () => InstrumentPriceCubit(datasource: Get.find()),
      fenix: true,
    );
}
