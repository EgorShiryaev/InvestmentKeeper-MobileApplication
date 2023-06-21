import 'package:get/get.dart';

import '../../data/datasources/is_user_datasource/is_user_datasource.dart';
import '../../data/datasources/is_user_datasource/is_user_remote_datasource.dart';
import '../../presentation/cubits/check_is_user_exists_cubit/check_is_user_exists_cubit.dart';

void checkIsUserExistsDependencyInjection() {
  Get
    ..create<IsUserDatasource>(
      () => IsUserRemoteDatasource(requestManager: Get.find()),
    )
    ..lazyPut(
      () => CheckIsUserExistsCubit(datasource: Get.find()),
      fenix: true,
    );
}
