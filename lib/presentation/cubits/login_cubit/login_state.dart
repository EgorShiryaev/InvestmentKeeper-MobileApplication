import '../../../domain/entities/auth_data.dart';

abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final AuthData data;

  SuccessLoginState({required this.data});
}

class FailureLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final String message;

  ErrorLoginState({required this.message});
}
