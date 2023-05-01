import '../../../domain/entities/user.dart';

abstract class RegistrationDatasource {
  Future<User> registration({
    required String name,
    required String phoneNumber,
    required String password,
  });
}
