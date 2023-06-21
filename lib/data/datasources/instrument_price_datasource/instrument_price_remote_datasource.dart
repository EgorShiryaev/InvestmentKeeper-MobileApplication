import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/settings/app_settings.dart';
import '../../../core/utils/auth_utils/set_authorization_header.dart';
import '../../../core/utils/get_exception_from_dio_error.dart';
import '../../../domain/entities/candle.dart';
import '../../../domain/entities/candle_timesize.dart';
import '../../../domain/entities/money.dart';
import 'instrument_price_datasource.dart';

class InstrumentPriceRemoteDatasource extends InstrumentPriceDatasource {
  final Dio _requestManager;

  InstrumentPriceRemoteDatasource({
    required Dio requestManager,
  }) : _requestManager = requestManager;

  @override
  Future<Money> get(
    int instrumentId,
  ) async {
    try {
      setAuthorizationHeader(_requestManager);
      const url = '${AppSettings.apiVersionV1}/instrumentPrice';

      final queryParams = {
        'instrumentId': instrumentId,
      };
      log('GET $url');
      final res = await _requestManager.get(url, queryParameters: queryParams);
      // ignore: avoid_dynamic_calls
      final data = res.data['price'];
      return Money.fromJson(data);
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }
}
