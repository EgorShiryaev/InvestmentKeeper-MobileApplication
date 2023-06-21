import 'package:get/get.dart';

import '../../data/datasources/candles_datasource/candles_datasource.dart';
import '../../data/datasources/candles_datasource/candles_remote_dataource.dart';
import '../../domain/usecase/get_candles_usecase.dart';
import '../../presentation/cubits/candles_cubit/candles_cubit.dart';

void candlesCubitDependencyInjection() {
  Get
    ..create<CandlesDatasource>(
      () => CandlesRemoteDatasource(requestManager: Get.find()),
    )
    ..create(() => GetCandlesUsecase(datasource: Get.find()))
    ..lazyPut(
      () => CandlesCubit(usecase: Get.find()),
      fenix: true,
    );
}
