import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/get_error_message.dart';
import '../../../data/datasources/accounts_datasource/accounts_datasource.dart';
import 'user_accounts_state.dart';

class UserAccountsCubit extends Cubit<UserAccountsState> {
  final AccountsDatasource _datasource;
  late Timer _timer;

  UserAccountsCubit({required AccountsDatasource datasource})
      : _datasource = datasource,
        super(InitialUserAccountsState());

  Future<void> load() async {
    try {
      emit(LoadingUserAccountsState());
      final accounts = await _datasource.getAll();
      emit(LoadedUserAccountsState(accounts: accounts));
    } catch (error) {
      final message = getErrorMessage(error);
      emit(ErrorUserAccountsState(message: message));
    }
  }

  void subscribeToPrice() {
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
      if (isClosed) {
        unsubscrubeToPrice();
        return;
      }
      _datasource
          .getAll()
          .then((value) => emit(LoadedUserAccountsState(accounts: value)))
          .catchError((error) {
        final message = getErrorMessage(error);
        emit(ErrorUserAccountsState(message: message));
      });
    });
  }

  void unsubscrubeToPrice() {
    _timer.cancel();
  }
}
