import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../settings/app_settings.dart';
import 'auth_datasource_dependency_injection.dart';
import 'check_is_user_exists_dependency_injection.dart';
import 'login_dependency_injection.dart';
import 'registration_dependency_injection.dart';

void dependencyInjection() {
  Get.create(() => Dio(AppSettings.dioBaseOprions));
  checkIsUserExistsDependencyInjection();
  loginDependencyInjection();
  registrationDependencyInjection();
  authCubitDependencyInjection();
}
