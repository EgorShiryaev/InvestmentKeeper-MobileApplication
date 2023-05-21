import 'dart:developer';

import 'package:dio/dio.dart';

import '../settings/app_settings.dart';

void setAuthorizationHeader(Dio requestManager) {
  log(AppSettings.currentUser!.token);
  requestManager.options.headers['Authorization'] =
      'Basic ${AppSettings.currentUser!.token}';
}
