import 'package:get/get.dart';

import '../../data/datasources/purchases_datasource/purchases_datasource.dart';
import '../../data/datasources/purchases_datasource/purchases_remote_datasource.dart';
import '../../presentation/cubits/create_purchase_cubit/create_purchase_cubit.dart';

void createPurchaseCubitDependencyInjection() {
  Get
    ..create<PurchasesDatasource>(
      () => PurchasesRemoteDatasource(requestManager: Get.find()),
    )
    ..lazyPut(
      () => CreatePurchaseCubit(datasource: Get.find()),
      fenix: true,
    );
}
