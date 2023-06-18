import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/settings/app_settings.dart';
import '../../../core/utils/auth_utils/encode_password.dart';
import '../../../core/utils/get_exception_from_dio_error.dart';
import '../../../domain/entities/user.dart';
import 'login_datasource.dart';

class LoginRemoteDatasource extends LoginDatasource {
  final Dio _requestManager;

  LoginRemoteDatasource({
    required Dio requestManager,
  }) : _requestManager = requestManager;

  @override
  Future<User> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final params = {
        'phoneNumber': phoneNumber,
        'password': encodePassword(password),
      };
      const url = '${AppSettings.apiVersionV1}/login';
      log('POST $url');
      final response = await _requestManager.post(
        url,
        data: params,
      );

      final user = User.fromJson(response.data);
      AppSettings.currentUser = user;
      return user;
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }
}
