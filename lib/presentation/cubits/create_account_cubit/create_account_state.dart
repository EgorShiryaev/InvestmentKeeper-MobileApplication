abstract class CreateAccountState {}

class InitialCreateAccountState extends CreateAccountState {}

class LoadingCreateAccountState extends CreateAccountState {}

class SuccessCreateAccountState extends CreateAccountState {}

class FailureCreateAccountState extends CreateAccountState {
  final String message;

  FailureCreateAccountState({required this.message});
}
