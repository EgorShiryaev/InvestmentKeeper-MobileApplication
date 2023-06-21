import 'package:get/get.dart';

import '../../data/datasources/refills_datasource/refills_datasource.dart';
import '../../data/datasources/refills_datasource/refills_remote_datasource.dart';
import '../../presentation/cubits/create_refill_cubit/create_refill_cubit.dart';

void createRefillCubitDependencyInjection() {
  Get
    ..create<RefillsDatasource>(
      () => RefillsRemoteDatasource(requestManager: Get.find()),
    )
    ..lazyPut(
      () => CreateRefillCubit(datasource: Get.find()),
      fenix: true,
    );
}
