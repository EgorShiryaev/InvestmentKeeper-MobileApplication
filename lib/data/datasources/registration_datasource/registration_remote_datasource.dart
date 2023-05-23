import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/settings/app_settings.dart';
import '../../../core/utils/encode_password.dart';
import '../../../core/utils/get_exception_from_dio_error.dart';
import '../../../domain/entities/user.dart';
import 'registration_datasource.dart';

class RegistrationRemoteDatasource extends RegistrationDatasource {
  final Dio _requestManager;

  RegistrationRemoteDatasource({
    required Dio requestManager,
  }) : _requestManager = requestManager;

  @override
  Future<User> registration({
    required String name,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final params = {
        'name': name,
        'phoneNumber': phoneNumber,
        'password': encodePassword(password),
      };
      const url = '${AppSettings.apiVersionV1}/registration';
      log(url);
      final response = await _requestManager.post(
        url,
        data: params,
      );

      return User.fromJson(response.data);
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }
}
