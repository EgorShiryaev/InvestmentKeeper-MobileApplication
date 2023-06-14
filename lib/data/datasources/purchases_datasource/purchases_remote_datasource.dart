import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/settings/app_settings.dart';
import '../../../core/utils/auth_utils/set_authorization_header.dart';
import '../../../core/utils/get_exception_from_dio_error.dart';
import 'purchases_datasource.dart';

class PurchasesRemoteDatasource extends PurchasesDatasource {
  final Dio _requestManager;

  PurchasesRemoteDatasource({
    required Dio requestManager,
  }) : _requestManager = requestManager;

  @override
  Future<void> create({
    required int accountId,
    required int instrumentId,
    required int lots,
    required double price,
    required bool withdrawFundsFromBalance,
    DateTime? date,
    double? commission,
  }) async {
    try {
      setAuthorizationHeader(_requestManager);
      const url = '${AppSettings.apiVersionV1}/purchases';
      log('POST $url');
      final params = {
        'accountId': accountId,
        'instrumentId': instrumentId,
        'lots': lots,
        'price': price,
        'withdrawFundsFromBalance': withdrawFundsFromBalance,
        'date': date?.toIso8601String(),
        'commission': commission,
      };
      await _requestManager.post(url, data: params);
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }
}
