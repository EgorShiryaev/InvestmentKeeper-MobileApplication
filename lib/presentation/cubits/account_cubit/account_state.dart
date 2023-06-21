import '../../../domain/entities/account.dart';
import '../error_cubit_state.dart';

abstract class AccountState {}

class InitialAccountState extends AccountState {}

class LoadingAccountState extends AccountState {}

class LoadedAccountState extends AccountState {
  final Account account;

  LoadedAccountState({required this.account});
}

class ErrorAccountState extends ErrorState implements AccountState {
  ErrorAccountState({required super.message});
}
