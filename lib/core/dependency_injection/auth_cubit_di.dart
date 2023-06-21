import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../data/datasources/auth_datasource/auth_datasource.dart';
import '../../data/datasources/auth_datasource/auth_local_datasource.dart';
import '../../presentation/cubits/auth_cubit/auth_cubit.dart';

void authCubitDependencyInjection() {
  const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Get
    ..create<AuthDatasource>(
      () => AuthLocalDatasource(secureStorage: secureStorage),
    )
    ..lazyPut(
      () => AuthCubit(
        authDatasource: Get.find(),
        loginDatasource: Get.find(),
      ),
      fenix: true,
    );
  
}
