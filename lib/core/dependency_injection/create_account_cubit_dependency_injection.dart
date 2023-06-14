import 'package:get/get.dart';

import '../../presentation/cubits/create_account_cubit/create_account_cubit.dart';

void createAccountCubitDependencyInjection() {
  Get.lazyPut(
    () => CreateAccountCubit(datasource: Get.find()),
    fenix: true,
  );
}
