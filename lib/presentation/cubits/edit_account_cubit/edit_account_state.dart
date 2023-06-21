import '../error_cubit_state.dart';

abstract class EditAccountState {}

class InitialEditAccountState extends EditAccountState {}

class LoadingEditAccountState extends EditAccountState {}

class SuccessEditAccountState extends EditAccountState {}

class FailureEditAccountState extends ErrorState implements EditAccountState {
  FailureEditAccountState({required super.message});
}
