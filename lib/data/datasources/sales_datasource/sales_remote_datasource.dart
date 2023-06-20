import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/settings/app_settings.dart';
import '../../../core/utils/auth_utils/set_authorization_header.dart';
import '../../../core/utils/get_exception_from_dio_error.dart';
import '../../../domain/entities/money.dart';
import 'sales_datasource.dart';

class SalesRemoteDatasource extends SalesDatasource {
  final Dio _requestManager;

  SalesRemoteDatasource({
    required Dio requestManager,
  }) : _requestManager = requestManager;

  @override
  Future<void> create({
    required int accountId,
    required int instrumentId,
    required int lots,
    required Money price,
    required bool addFundsFromSaleToBalance,
    required DateTime date,
    Money? commission,
  }) async {
    try {
      setAuthorizationHeader(_requestManager);
      const url = '${AppSettings.apiVersionV1}/sales';
      log('POST $url');
      final dateUtcIso = date.toUtc().toIso8601String();
      final params = {
        'accountId': accountId,
        'instrumentId': instrumentId,
        'lots': lots,
        'addFundsFromSaleToBalance': addFundsFromSaleToBalance,
        'date': dateUtcIso,
        'price': price.toJson(),
        'commission': commission?.toJson(),
      };
      await _requestManager.post(url, data: params);
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }
}
