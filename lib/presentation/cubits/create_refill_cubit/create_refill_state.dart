import '../error_cubit_state.dart';

abstract class CreateRefillState {}

class InitialCreateRefillState extends CreateRefillState {}

class LoadingCreateRefillState extends CreateRefillState {}

class SuccessCreateRefillState extends CreateRefillState {}

class FailureCreateRefillState extends ErrorState implements CreateRefillState {
  FailureCreateRefillState({required super.message});
}
