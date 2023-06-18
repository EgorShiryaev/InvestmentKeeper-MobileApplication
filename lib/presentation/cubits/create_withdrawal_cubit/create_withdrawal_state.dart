import '../error_cubit_state.dart';

abstract class CreateWithdrawalState {}

class InitialCreateWithdrawalState extends CreateWithdrawalState {}

class LoadingCreateWithdrawalState extends CreateWithdrawalState {}

class SuccessCreateWithdrawalState extends CreateWithdrawalState {}

class FailureCreateWithdrawalState extends ErrorCubitState
    implements CreateWithdrawalState {
  FailureCreateWithdrawalState({required super.message});
}
