import '../error_cubit_state.dart';

abstract class CreateSaleState {}

class InitialCreateSaleState extends CreateSaleState {}

class LoadingCreateSaleState extends CreateSaleState {}

class SuccessCreateSaleState extends CreateSaleState {}

class FailureCreateSaleState extends ErrorState implements CreateSaleState {
  FailureCreateSaleState({required super.message});
}
