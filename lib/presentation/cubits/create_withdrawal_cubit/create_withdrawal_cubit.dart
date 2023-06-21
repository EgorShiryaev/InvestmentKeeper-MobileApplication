import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/get_error_message.dart';
import '../../../data/datasources/withdrawals_datasource/withdrawals_datasource.dart';
import '../../../domain/entities/currency.dart';
import '../../../domain/entities/money.dart';
import 'create_withdrawal_state.dart';

class CreateWithdrawalCubit extends Cubit<CreateWithdrawalState> {
  final WithdrawalsDatasource _datasource;
  CreateWithdrawalCubit({required WithdrawalsDatasource datasource})
      : _datasource = datasource,
        super(InitialCreateWithdrawalState());

  Future<void> create({
    required int accountId,
    required Money value,
    required Currency currency,
    required DateTime date,
  }) async {
    try {
      emit(LoadingCreateWithdrawalState());
      await _datasource.create(
        accountId: accountId,
        value: value,
        currency: currency,
        date: date,
      );
      emit(SuccessCreateWithdrawalState());
    } catch (error) {
      final message = getErrorMessage(error);
      emit(FailureCreateWithdrawalState(message: message));
    }
  }
}
