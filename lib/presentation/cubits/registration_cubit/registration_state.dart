import '../../../domain/entities/auth_data.dart';
import '../error_cubit_state.dart';

abstract class RegistrationState {}

class InitialRegistrationState extends RegistrationState {}

class LoadingRegistrationState extends RegistrationState {}

class SuccessRegistrationState extends RegistrationState {
  final AuthData data;

  SuccessRegistrationState({required this.data});
}

class UserIsAlreadyExistsRegistrationState extends RegistrationState {}

class ErrorRegistrationState extends ErrorCubitState
    implements RegistrationState {
  ErrorRegistrationState({required super.message});
}
