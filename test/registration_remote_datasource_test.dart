import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:investment_keeper/core/exceptions/bad_request_exception.dart';
import 'package:investment_keeper/core/settings/app_settings.dart';
import 'package:investment_keeper/data/datasources/registration_datasource/registration_remote_datasource.dart';

void main() {
  final dio = Dio(AppSettings.dioBaseOprions);
  final registrationRemoteDatasource = RegistrationRemoteDatasource(
    requestManager: dio,
  );

  const name = 'Тестовый';

  const newPhoneNumber = '+7(000)000-00-01';
  const newPassword = '1';

  const existsPhoneNumber = '+7(000)000-00-00';
  const existsPassword = '12345678';

  group('test registrationRemoteDatasource', () {
    test('send new phone number and new password', () async {
      final newUser = await registrationRemoteDatasource.registration(
        name: name,
        phoneNumber: newPhoneNumber,
        password: newPassword,
      );
      final userIsExists = newUser != null;
      expect(userIsExists, true);
    });
    test('send exist phone number and exist password', () async {
      try {
        await registrationRemoteDatasource.registration(
          name: name,
          phoneNumber: existsPhoneNumber,
          password: existsPassword,
        );
      } catch (e) {
        expect(e is BadRequestException, true);
      }
    });
  });
}
