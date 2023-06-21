import 'package:get/get.dart';

import '../../data/datasources/registration_datasource/registration_datasource.dart';

import '../../data/datasources/registration_datasource/registration_remote_datasource.dart';
import '../../presentation/cubits/registration_cubit/registration_cubit.dart';

void registrationDependencyInjection() {
  Get
    ..create<RegistrationDatasource>(
      () => RegistrationRemoteDatasource(requestManager: Get.find()),
    )
    ..lazyPut(
      () => RegistrationCubit(datasource: Get.find()),
      fenix: true,
    );
}
