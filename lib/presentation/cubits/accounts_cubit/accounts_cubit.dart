import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/exception_impl.dart';
import '../../../data/datasources/accounts_datasource/accounts_datasource.dart';
import 'accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  final AccountsDatasource _datasource;

  AccountsCubit({required AccountsDatasource datasource})
      : _datasource = datasource,
        super(InitialAccountsState());

  Future<void> load() async {
    try {
      emit(LoadingAccountsState());
      final accounts = await _datasource.getAll();
      emit(LoadedAccountsState(accounts: accounts));
    } catch (error) {
      final message = error is ExceptionImpl ? error.message : error.toString();
      emit(ErrorAccountsState(message: message));
    }
  }
}
