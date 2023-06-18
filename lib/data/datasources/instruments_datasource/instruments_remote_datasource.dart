import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/settings/app_settings.dart';
import '../../../core/utils/auth_utils/set_authorization_header.dart';
import '../../../core/utils/get_exception_from_dio_error.dart';
import '../../../domain/entities/instrument.dart';
import 'instruments_datasource.dart';

class InstrumentsRemoteDatasource extends InstrumentsDatasource {
  final Dio _requestManager;

  InstrumentsRemoteDatasource({
    required Dio requestManager,
  }) : _requestManager = requestManager;

  @override
  Future<List<Instrument>> search(String query) async {
    try {
      setAuthorizationHeader(_requestManager);
      const url = '${AppSettings.apiVersionV1}/searchInvestInstrument';
      log('GET $url');
      final res =
          await _requestManager.get(url, queryParameters: {'query': query});
      // ignore: avoid_dynamic_calls
      final data = res.data['instruments'] as List;
      return data
          .map((v) => Instrument.fromJson(v as Map<String, dynamic>))
          .toList();
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }
}
