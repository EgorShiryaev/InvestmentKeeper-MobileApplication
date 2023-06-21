import '../error_cubit_state.dart';

abstract class CreateAccountState {}

class InitialCreateAccountState extends CreateAccountState {}

class LoadingCreateAccountState extends CreateAccountState {}

class SuccessCreateAccountState extends CreateAccountState {}

class FailureCreateAccountState extends ErrorState
    implements CreateAccountState {
  FailureCreateAccountState({required super.message});
}
