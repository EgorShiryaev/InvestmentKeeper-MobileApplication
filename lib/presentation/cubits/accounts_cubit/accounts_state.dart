import '../../../domain/entities/account.dart';

abstract class AccountsState {}

class InitialAccountsState extends AccountsState {}

class LoadingAccountsState extends AccountsState {}

class LoadedAccountsState extends AccountsState {
  final List<Account> accounts;

  LoadedAccountsState({required this.accounts});
}

class ErrorAccountsState extends AccountsState {
  final String message;

  ErrorAccountsState({required this.message});
}
