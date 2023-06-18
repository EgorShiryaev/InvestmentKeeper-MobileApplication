import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/settings/app_settings.dart';
import '../../../core/utils/auth_utils/set_authorization_header.dart';
import '../../../core/utils/convectors/currency_to_josn.dart';
import '../../../core/utils/get_exception_from_dio_error.dart';
import '../../../domain/entities/currency.dart';
import 'refills_datasource.dart';

class RefillsRemoteDatasource extends RefillsDatasource {
  final Dio _requestManager;

  RefillsRemoteDatasource({
    required Dio requestManager,
  }) : _requestManager = requestManager;

  @override
  Future<void> create({
    required int accountId,
    required double value,
    required Currency currency,
    required DateTime date,
  }) async {
    try {
      setAuthorizationHeader(_requestManager);
      const url = '${AppSettings.apiVersionV1}/refills';
      log('POST $url');
      final dateUtcIso = date.toUtc().toIso8601String();
      final params = {
        'accountId': accountId,
        'value': value,
        'currency': currencyToJson(currency),
        'date': dateUtcIso,
      };
      await _requestManager.post(url, data: params);
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }
}
