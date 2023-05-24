import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/settings/app_settings.dart';
import '../../../core/utils/get_exception_from_dio_error.dart';
import '../../../core/utils/set_authorization_header.dart';
import 'create_account_datasource.dart';

class CreateAccountRemoteDatasource extends CreateAccountDatasource {
  final Dio _requestManager;

  CreateAccountRemoteDatasource({
    required Dio requestManager,
  }) : _requestManager = requestManager;

  @override
  Future<void> create({required String title}) async {
    try {
      setAuthorizationHeader(_requestManager);
      const url = '${AppSettings.apiVersionV1}/accounts';
      log('POST $url');
      final params = {
        'title': title,
      };
      await _requestManager.post(url, data: params);
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }
}
