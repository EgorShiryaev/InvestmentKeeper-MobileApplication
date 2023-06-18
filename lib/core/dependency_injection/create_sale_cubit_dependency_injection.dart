import 'package:get/get.dart';

import '../../data/datasources/sales_datasource/sales_datasource.dart';
import '../../data/datasources/sales_datasource/sales_remote_datasource.dart';
import '../../presentation/cubits/create_sale_cubit/create_sale_cubit.dart';

void createSaleCubitDependencyInjection() {
  Get
    ..create<SalesDatasource>(
      () => SalesRemoteDatasource(requestManager: Get.find()),
    )
    ..lazyPut(
      () => CreateSaleCubit(datasource: Get.find()),
      fenix: true,
    );
}
