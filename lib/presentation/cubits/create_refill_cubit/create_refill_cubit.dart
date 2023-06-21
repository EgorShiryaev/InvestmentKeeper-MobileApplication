import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/get_error_message.dart';
import '../../../data/datasources/refills_datasource/refills_datasource.dart';
import '../../../domain/entities/currency.dart';
import '../../../domain/entities/money.dart';
import 'create_refill_state.dart';

class CreateRefillCubit extends Cubit<CreateRefillState> {
  final RefillsDatasource _datasource;
  CreateRefillCubit({required RefillsDatasource datasource})
      : _datasource = datasource,
        super(InitialCreateRefillState());

  Future<void> create({
    required int accountId,
    required Money value,
    required Currency currency,
    required DateTime date,
  }) async {
    try {
      emit(LoadingCreateRefillState());
      await _datasource.create(
        accountId: accountId,
        value: value,
        currency: currency,
        date: date,
      );
      emit(SuccessCreateRefillState());
    } catch (error) {
      final message = getErrorMessage(error);
      emit(FailureCreateRefillState(message: message));
    }
  }
}
