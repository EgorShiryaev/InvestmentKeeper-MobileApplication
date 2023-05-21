import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../domain/entities/auth_data.dart';
import 'auth_datasource.dart';

class AuthLocalDatasource extends AuthDatasource {
  final FlutterSecureStorage _secureStorage;

  AuthLocalDatasource({required FlutterSecureStorage secureStorage})
      : _secureStorage = secureStorage;

  static const _phoneNumberKey = 'phoneNumber';
  static const _passwordKey = 'password';

  @override
  Future<AuthData?> getAuthData() async {
    return Future.wait([
      _secureStorage.read(key: _phoneNumberKey),
      _secureStorage.read(key: _passwordKey),
    ]).then((value) {
      final phoneNumber = value[0];
      final password = value[1];
      if (phoneNumber == null || password == null) {
        return null;
      }
      return AuthData(phoneNumber: phoneNumber, password: password);
    });
  }

  @override
  Future<void> setAuthData(AuthData authData) async {
    await Future.wait([
      _secureStorage.write(key: _phoneNumberKey, value: authData.phoneNumber),
      _secureStorage.write(key: _passwordKey, value: authData.password),
    ]);
  }

  @override
  Future<void> removeAuthData() async {
    await Future.wait([
      _secureStorage.delete(key: _phoneNumberKey),
      _secureStorage.delete(key: _passwordKey),
    ]);
  }
}
