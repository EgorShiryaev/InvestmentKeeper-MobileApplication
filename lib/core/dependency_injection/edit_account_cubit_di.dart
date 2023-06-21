import 'package:get/get.dart';

import '../../presentation/cubits/edit_account_cubit/edit_account_cubit.dart';

void editAccountCubitDependencyInjection() {
  Get.lazyPut(
    () => EditAccountCubit(datasource: Get.find()),
    fenix: true,
  );
}
