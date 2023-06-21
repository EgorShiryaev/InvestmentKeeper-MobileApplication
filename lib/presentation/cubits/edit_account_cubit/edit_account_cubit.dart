import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/get_error_message.dart';
import '../../../data/datasources/accounts_datasource/accounts_datasource.dart';
import 'edit_account_state.dart';

class EditAccountCubit extends Cubit<EditAccountState> {
  final AccountsDatasource _datasource;
  EditAccountCubit({required AccountsDatasource datasource})
      : _datasource = datasource,
        super(InitialEditAccountState());

  Future<void> rename({required String title, required int id}) async {
    try {
      emit(LoadingEditAccountState());
      await _datasource.edit(title: title, id: id);
      emit(SuccessEditAccountState());
    } catch (error) {
      final message = getErrorMessage(error);
      emit(FailureEditAccountState(message: message));
    }
  }
}
