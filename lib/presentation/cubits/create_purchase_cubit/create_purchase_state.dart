import '../error_cubit_state.dart';

abstract class CreatePurchaseState {}

class InitialCreatePurchaseState extends CreatePurchaseState {}

class LoadingCreatePurchaseState extends CreatePurchaseState {}

class SuccessCreatePurchaseState extends CreatePurchaseState {}

class FailureCreatePurchaseState extends ErrorState
    implements CreatePurchaseState {
  FailureCreatePurchaseState({required super.message});
}
