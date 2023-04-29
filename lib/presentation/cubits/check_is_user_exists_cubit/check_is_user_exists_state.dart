abstract class CheckIsUserExistsState {}

class InitialCheckIsUserExistsState extends CheckIsUserExistsState {}

class LoadingCheckIsUserExistsState extends CheckIsUserExistsState {}

class ErrorCheckIsUserExistsState extends CheckIsUserExistsState {
  final String message;

  ErrorCheckIsUserExistsState({required this.message});
}
