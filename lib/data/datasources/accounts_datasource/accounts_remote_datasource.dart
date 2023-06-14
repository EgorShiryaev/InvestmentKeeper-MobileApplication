import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/settings/app_settings.dart';
import '../../../core/utils/get_exception_from_dio_error.dart';
import '../../../core/utils/set_authorization_header.dart';
import '../../../domain/entities/account_entity.dart';
import 'accounts_datasource.dart';

class AccountsRemoteDatasource extends AccountsDatasource {
  final Dio _requestManager;

  AccountsRemoteDatasource({
    required Dio requestManager,
  }) : _requestManager = requestManager;

  @override
  Future<List<AccountEntity>> getAll() async {
    try {
      setAuthorizationHeader(_requestManager);
      const url = '${AppSettings.apiVersionV1}/accounts';
      log('GET $url');
      final res = await _requestManager.get(url);
      // ignore: avoid_dynamic_calls
      final data = res.data['accounts'] as List;
      return data
          .map((v) => AccountEntity.fromJson(v as Map<String, dynamic>))
          .toList();
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }

  @override
  Future<AccountEntity> get(int id) async {
    try {
      setAuthorizationHeader(_requestManager);
      const url = '${AppSettings.apiVersionV1}/accounts';
      log('GET $url');
      final res = await _requestManager.get(url, queryParameters: {'id': id});
      return AccountEntity.fromJson(res.data as Map<String, dynamic>);
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }

  @override
  Future<void> create({required String title}) async {
    try {
      setAuthorizationHeader(_requestManager);
      const url = '${AppSettings.apiVersionV1}/accounts';
      log('POST $url');
      final params = {'title': title, 'currency': 'RUB'};
      await _requestManager.post(url, data: params);
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }

  @override
  Future<void> edit({required int id, required String title}) async {
    try {
      setAuthorizationHeader(_requestManager);
      const url = '${AppSettings.apiVersionV1}/accounts';
      log('PUT $url');
      final params = {
        'id': id,
        'title': title,
      };
      await _requestManager.put(url, data: params);
    } on DioError catch (error) {
      final exception = getExceptionFromDioError(error);
      throw exception;
    }
  }
}
