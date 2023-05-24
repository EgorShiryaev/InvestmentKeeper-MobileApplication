import 'package:get/get.dart';

import '../../data/datasources/accounts_datasource/accounts_datasource.dart';
import '../../data/datasources/accounts_datasource/accounts_remote_datasource.dart';
import '../../presentation/cubits/accounts_cubit/user_accounts_cubit.dart';

void userAccountsCubitDependencyInjection() {
  Get
    ..create<AccountsDatasource>(
      () => AccountsRemoteDatasource(requestManager: Get.find()),
    )
    ..lazyPut(
      () => UserAccountsCubit(datasource: Get.find()),
      fenix: true,
    );
}
