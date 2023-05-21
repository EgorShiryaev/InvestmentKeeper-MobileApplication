import '../../../domain/entities/auth_data.dart';

abstract class AuthDatasource {
  Future<AuthData?> getAuthData();
  Future<void> setAuthData(AuthData authData);
  Future<void> removeAuthData();
}
