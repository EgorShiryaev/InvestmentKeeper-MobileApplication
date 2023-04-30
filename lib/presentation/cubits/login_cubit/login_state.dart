abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {}

class FailureLoginState extends LoginState {
   final String message;

  FailureLoginState({required this.message});
}

class ErrorLoginState extends LoginState {
  final String message;

  ErrorLoginState({required this.message});
}
