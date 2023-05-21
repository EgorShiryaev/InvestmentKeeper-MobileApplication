import 'package:get/get.dart';

import '../../data/datasources/accounts_datasource/accounts_datasource.dart';
import '../../data/datasources/accounts_datasource/accounts_remote_datasource.dart';
import '../../presentation/cubits/accounts_cubit/accounts_cubit.dart';

void accountsCubitDependencyInjection() {
  Get
    ..create<AccountsDatasource>(
      () => AccountsRemoteDatasource(requestManager: Get.find()),
    )
    ..lazyPut(
      () => AccountsCubit(datasource: Get.find()),
      fenix: true,
    );
}
