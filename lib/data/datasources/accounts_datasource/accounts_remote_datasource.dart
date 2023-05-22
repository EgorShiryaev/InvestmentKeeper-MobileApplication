import 'package:dio/dio.dart';

import '../../../core/settings/app_settings.dart';
import '../../../core/utils/get_exception_from_dio_error.dart';
import '../../../core/utils/set_authorization_header.dart';
import '../../../domain/entities/account.dart';
import 'accounts_datasource.dart';

class AccountsRemoteDatasource extends AccountsDatasource {
  final Dio _requestManager;

  AccountsRemoteDatasource({
    required Dio requestManager,
  }) : _requestManager = requestManager;

  @override
  Future<List<Account>> getAll() async {
    try {
      setAuthorizationHeader(_requestManager);
      final res =
          await _requestManager.get('${AppSettings.apiVersionV1}/accounts');
      // ignore: avoid_dynamic_calls
      final data = res.data['accounts'] as List;
      return data
          .map((v) => Account.fromJson(v as Map<String, dynamic>))
          .toList();
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }
}
