import '../error_cubit_state.dart';

abstract class CheckIsUserExistsState {}

class InitialCheckIsUserExistsState extends CheckIsUserExistsState {}

class LoadingCheckIsUserExistsState extends CheckIsUserExistsState {}

class SuccessCheckIsUserExistsState extends CheckIsUserExistsState {}

class FailureCheckIsUserExistsState extends CheckIsUserExistsState {}

class ErrorCheckIsUserExistsState extends ErrorState
    implements CheckIsUserExistsState {
  ErrorCheckIsUserExistsState({required super.message});
}
