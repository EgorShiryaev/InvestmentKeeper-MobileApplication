import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/utils/get_error_message.dart';
import '../../../data/datasources/accounts_datasource/accounts_datasource.dart';
import '../../pages/arguments/account_page_arguments.dart';
import 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountsDatasource _datasource;
  late Timer _timer;

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
      final message = getErrorMessage(error);
      emit(ErrorAccountState(message: message));
    }
  }

  void subscribeToPrice() {
    final args = Get.arguments as AccountPageArguments;
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
      _datasource
          .get(args.account.id)
          .then((value) => emit(LoadedAccountState(account: value)))
          .catchError((error) {
        final message = getErrorMessage(error);
        emit(ErrorAccountState(message: message));
      });
    });
  }

  void unsubscrubeToPrice() {
    _timer.cancel();
  }
}
