import 'package:get/get.dart';

import '../../presentation/cubits/account_cubit/account_cubit.dart';

void accountCubitDependencyInjection() {
  Get.lazyPut(
    () => AccountCubit(datasource: Get.find()),
    fenix: true,
  );
}
