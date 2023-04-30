import 'package:dio/dio.dart';

import '../../../core/exceptions/not_found_exception.dart';
import '../../../core/utils/encode_password.dart';
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
      final response = await _requestManager.post(
        '/login',
        data: params,
      );

      return User.fromJson(response.data);
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }
}
