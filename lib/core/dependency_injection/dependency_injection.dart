import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'check_is_user_exists_dependency_injection.dart';

void dependencyInjection() {
  Get.lazyPut(
    () => Dio(
      BaseOptions(baseUrl: 'http://127.0.0.1:9999'),
    ),
  );
  checkIsUserExistsDependencyInjection();
}
