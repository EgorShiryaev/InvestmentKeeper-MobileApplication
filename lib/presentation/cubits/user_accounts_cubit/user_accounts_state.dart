import '../../../domain/entities/account_entity.dart';
import '../error_cubit_state.dart';

abstract class UserAccountsState {}

class InitialUserAccountsState extends UserAccountsState {}

class LoadingUserAccountsState extends UserAccountsState {}

class LoadedUserAccountsState extends UserAccountsState {
  final List<AccountEntity> accounts;

  LoadedUserAccountsState({required this.accounts});
}

class ErrorUserAccountsState extends ErrorCubitState
    implements UserAccountsState {
  ErrorUserAccountsState({required super.message});
}
