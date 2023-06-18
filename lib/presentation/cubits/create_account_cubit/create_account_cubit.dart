import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/exception_impl.dart';
import '../../../data/datasources/accounts_datasource/accounts_datasource.dart';
import 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final AccountsDatasource _datasource;
  CreateAccountCubit({required AccountsDatasource datasource})
      : _datasource = datasource,
        super(InitialCreateAccountState());

  Future<void> create(String title) async {
    try {
      emit(LoadingCreateAccountState());
      await _datasource.create(title: title);
      emit(SuccessCreateAccountState());
    } catch (error) {
      final message = error is ExceptionImpl ? error.message : error.toString();
      emit(FailureCreateAccountState(message: message));
    }
  }
}
