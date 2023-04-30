import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:investment_keeper/core/exceptions/bad_request_exception.dart';
import 'package:investment_keeper/core/settings/app_settings.dart';
import 'package:investment_keeper/data/datasources/is_user_datasource/is_user_remote_datasource.dart';

void main() {
  final dio = Dio(AppSettings.dioBaseOprions);
  final isUserRemoteDatasource = IsUserRemoteDatasource(requestManager: dio);

  const testPhoneNumber = '+7(123)456-78-90';
  const invalidPhoneNumber = '+7(123)456-78-9';
  const notFoundPhoneNumber = '+7(000)000-00-00';
  group('test isUserRemoteDatasource', () {
    test('send test phone number', () async {
      final request = await isUserRemoteDatasource.get(testPhoneNumber);
      expect(request, true);
    });
    test('send invalid phone number', () async {
      try {
        await isUserRemoteDatasource.get(invalidPhoneNumber);
      } catch (e) {
        expect(e is BadRequestException, true);
      }
    });
    test('send not found phone number', () async {
      final request = await isUserRemoteDatasource.get(notFoundPhoneNumber);
      expect(request, false);
    });
  });
}
