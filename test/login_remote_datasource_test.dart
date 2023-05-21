// ignore_for_file: unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:investment_keeper/core/exceptions/failed_auth_exception.dart';
import 'package:investment_keeper/core/settings/app_settings.dart';
import 'package:investment_keeper/data/datasources/login_datasource/login_remote_datasource.dart';

void main() {
  final dio = Dio(AppSettings.dioBaseOprions);
  final loginRemoteDatasource = LoginRemoteDatasource(requestManager: dio);

  const testPhoneNumber = '+7(000)000-00-00';
  const testPassword = '12345678';
  const invalidPhoneNumber = '+7(000)000-00-0';
  const invalidPassword = '12345679';

  group('test loginRemoteDatasource', () {
    test('send test phone number and test password', () async {
      final user = await loginRemoteDatasource.login(
        phoneNumber: testPhoneNumber,
        password: testPassword,
      );
      final userIsExists = user != null;
      expect(userIsExists, true);
    });
    test('send invalid phone number and test password', () async {
      try {
        await loginRemoteDatasource.login(
          phoneNumber: invalidPhoneNumber,
          password: testPassword,
        );
      } catch (e) {
        expect(e is FailedAuthException, true);
      }
    });
    test('send test phone number and invalid password', () async {
      try {
        await loginRemoteDatasource.login(
          phoneNumber: testPhoneNumber,
          password: invalidPassword,
        );
      } catch (e) {
        expect(e is FailedAuthException, true);
      }
    });
    test('send invalid phone number and invalid password', () async {
      try {
        await loginRemoteDatasource.login(
          phoneNumber: invalidPhoneNumber,
          password: invalidPassword,
        );
      } catch (e) {
        expect(e is FailedAuthException, true);
      }
    });
  });
}
