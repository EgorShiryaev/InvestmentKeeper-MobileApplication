import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/exception_impl.dart';
import '../../../data/datasources/accounts_datasource/accounts_datasource.dart';
import 'user_accounts_state.dart';

class UserAccountsCubit extends Cubit<UserAccountsState> {
  final AccountsDatasource _datasource;

  UserAccountsCubit({required AccountsDatasource datasource})
      : _datasource = datasource,
        super(InitialUserAccountsState());

  Future<void> load() async {
    try {
      emit(LoadingUserAccountsState());
      final accounts = await _datasource.getAll();
      emit(LoadedUserAccountsState(accounts: accounts));
    } catch (error) {
      final message = error is ExceptionImpl ? error.message : error.toString();
      emit(ErrorUserAccountsState(message: message));
    }
  }
}
