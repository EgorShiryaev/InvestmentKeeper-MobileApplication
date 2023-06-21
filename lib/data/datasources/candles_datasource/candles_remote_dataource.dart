import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/settings/app_settings.dart';
import '../../../core/utils/auth_utils/set_authorization_header.dart';
import '../../../core/utils/get_exception_from_dio_error.dart';
import '../../../domain/entities/candle.dart';
import '../../../domain/entities/candle_timesize.dart';
import 'candles_datasource.dart';

class CandlesRemoteDatasource extends CandlesDatasource {
  final Dio _requestManager;

  CandlesRemoteDatasource({
    required Dio requestManager,
  }) : _requestManager = requestManager;

  @override
  Future<List<Candle>> get({
    required int instrumentId,
    required CandleTimesize candleTimesize,
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      setAuthorizationHeader(_requestManager);
      const url = '${AppSettings.apiVersionV1}/candles';

      final queryParams = {
        'instrumentId': instrumentId,
        'candleTimesize': candleTimesizeMap[candleTimesize],
        'from': from.toUtc().toIso8601String(),
        'to': to.toUtc().toIso8601String(),
      };
      log('GET $url');
      final res = await _requestManager.get(url, queryParameters: queryParams);
      // ignore: avoid_dynamic_calls
      final data = res.data['candles'] as List;
      return data
          .map((v) => Candle.fromJson(v as Map<String, dynamic>))
          .toList();
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }
}
