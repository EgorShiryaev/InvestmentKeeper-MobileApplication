abstract class RegistrationState {}

class InitialRegistrationState extends RegistrationState {}

class LoadingRegistrationState extends RegistrationState {}

class SuccessRegistrationState extends RegistrationState {}

class UserIsAlreadyExistsRegistrationState extends RegistrationState {}

class ErrorRegistrationState extends RegistrationState {
  final String message;

  ErrorRegistrationState({required this.message});
}
