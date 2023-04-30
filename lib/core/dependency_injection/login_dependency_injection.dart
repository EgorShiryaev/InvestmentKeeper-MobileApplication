import 'package:get/get.dart';

import '../../data/datasources/login_datasource/login_datasource.dart';
import '../../data/datasources/login_datasource/login_remote_datasource.dart';
import '../../presentation/cubits/login_cubit/login_cubit.dart';

void loginDependencyInjection() {
  Get
    ..create<LoginDatasource>(
      () => LoginRemoteDatasource(requestManager: Get.find()),
    )
    ..lazyPut(
      () => LoginCubit(datasource: Get.find()),
      fenix: true,
    );
}
