import 'package:dio/dio.dart';

import '../../../core/exceptions/not_found_exception.dart';
import '../../../core/settings/app_settings.dart';
import '../../../core/utils/get_exception_from_dio_error.dart';
import 'is_user_datasource.dart';

class IsUserRemoteDatasource extends IsUserDatasource {
  final Dio _requestManager;

  IsUserRemoteDatasource({
    required Dio requestManager,
  }) : _requestManager = requestManager;

  @override
  Future<bool> get(String phoneNumber) async {
    try {
      await _requestManager.get(
        '${AppSettings.apiVersionV1}/isUser',
        queryParameters: {'phoneNumber': phoneNumber},
      );

      return true;
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      if (exception is NotFoundException) {
        return false;
      }
      throw exception;
    }
  }
}
