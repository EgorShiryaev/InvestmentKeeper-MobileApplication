import 'package:dio/dio.dart';

import '../../settings/app_settings.dart';

void setAuthorizationHeader(Dio requestManager) {
  requestManager.options.headers['Authorization'] =
      'Basic ${AppSettings.currentUser!.token}';
}
