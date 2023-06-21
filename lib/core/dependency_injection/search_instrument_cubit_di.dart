import 'package:get/get.dart';

import '../../data/datasources/instruments_datasource/instruments_datasource.dart';
import '../../data/datasources/instruments_datasource/instruments_remote_datasource.dart';
import '../../presentation/cubits/search_instrument_cubit/search_instrument_cubit.dart';

void searchInstrumentCubitDependencyInjection() {
  Get
    ..create<InstrumentsDatasource>(
      () => InstrumentsRemoteDatasource(requestManager: Get.find()),
    )
    ..lazyPut(
      () => SearchInstrumentCubit(datasource: Get.find()),
      fenix: true,
    );
}
