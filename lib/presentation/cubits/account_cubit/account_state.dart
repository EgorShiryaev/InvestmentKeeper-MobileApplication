import '../../../domain/entities/account_entity.dart';
import '../error_cubit_state.dart';

abstract class AccountState {}

class InitialAccountState extends AccountState {}

class LoadingAccountState extends AccountState {}

class LoadedAccountState extends AccountState {
  final AccountEntity account;

  LoadedAccountState({required this.account});
}

class ErrorAccountState extends ErrorCubitState implements AccountState {
  ErrorAccountState({required super.message});
}
