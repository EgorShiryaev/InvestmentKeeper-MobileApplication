import 'package:get/get.dart';

import '../../data/datasources/create_account_datasource/create_account_datasource.dart';
import '../../data/datasources/create_account_datasource/create_account_remote_dataspurce.dart';
import '../../presentation/cubits/create_account_cubit/create_account_cubit.dart';

void createAccountCubitDependencyInjection() {
  Get
    ..create<CreateAccountDatasource>(
      () => CreateAccountRemoteDatasource(requestManager: Get.find()),
    )
    ..lazyPut(
      () => CreateAccountCubit(datasource: Get.find()),
      fenix: true,
    );
}
