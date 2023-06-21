import '../../../domain/entities/account.dart';
import '../error_cubit_state.dart';

abstract class UserAccountsState {}

class InitialUserAccountsState extends UserAccountsState {}

class LoadingUserAccountsState extends UserAccountsState {}

class LoadedUserAccountsState extends UserAccountsState {
  final List<Account> accounts;

  LoadedUserAccountsState({required this.accounts});
}

class ErrorUserAccountsState extends ErrorState implements UserAccountsState {
  ErrorUserAccountsState({required super.message});
}
