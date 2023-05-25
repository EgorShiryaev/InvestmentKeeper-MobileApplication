import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/exceptions/exception_impl.dart';
import '../../../data/datasources/accounts_datasource/accounts_datasource.dart';
import '../../pages/arguments/account_page_arguments.dart';
import 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountsDatasource _datasource;

  AccountCubit({required AccountsDatasource datasource})
      : _datasource = datasource,
        super(InitialAccountState());

  Future<void> refresh() {
    final args = Get.arguments as AccountPageArguments;
    return load(args.account.id);
  }

  Future<void> load(int id) async {
    try {
      emit(LoadingAccountState());
      final account = await _datasource.get(id);
      emit(LoadedAccountState(account: account));
    } catch (error) {
      final message = error is ExceptionImpl ? error.message : error.toString();
      emit(ErrorAccountState(message: message));
    }
  }
}
