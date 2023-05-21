abstract class AuthState {}

class InitialAuthState extends AuthState {}

class UserIsAuthState extends AuthState {}

class UserIsUnauthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String message;

  ErrorAuthState({required this.message});
}
