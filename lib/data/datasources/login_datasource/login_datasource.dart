import '../../../domain/entities/user.dart';

abstract class LoginDatasource {
  Future<User> login({
    required String phoneNumber,
    required String password,
  });
}
