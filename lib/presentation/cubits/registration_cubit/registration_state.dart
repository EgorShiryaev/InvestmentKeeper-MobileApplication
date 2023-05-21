import '../../../domain/entities/auth_data.dart';

abstract class RegistrationState {}

class InitialRegistrationState extends RegistrationState {}

class LoadingRegistrationState extends RegistrationState {}

class SuccessRegistrationState extends RegistrationState {
  final AuthData data;

  SuccessRegistrationState({required this.data});
}

class UserIsAlreadyExistsRegistrationState extends RegistrationState {}

class ErrorRegistrationState extends RegistrationState {
  final String message;

  ErrorRegistrationState({required this.message});
}
