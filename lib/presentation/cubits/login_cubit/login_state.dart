import '../../../domain/entities/auth_data.dart';
import '../error_cubit_state.dart';

abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final AuthData data;

  SuccessLoginState({required this.data});
}

class FailureLoginState extends LoginState {}

class ErrorLoginState extends ErrorCubitState implements LoginState {
  ErrorLoginState({required super.message});
}
