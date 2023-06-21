import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/get_error_message.dart';
import '../../../data/datasources/purchases_datasource/purchases_datasource.dart';
import '../../../domain/entities/money.dart';
import 'create_purchase_state.dart';

class CreatePurchaseCubit extends Cubit<CreatePurchaseState> {
  final PurchasesDatasource _datasource;
  CreatePurchaseCubit({required PurchasesDatasource datasource})
      : _datasource = datasource,
        super(InitialCreatePurchaseState());

  Future<void> create({
    required int accountId,
    required int instrumentId,
    required int lots,
    required Money price,
    required bool withdrawFundsFromBalance,
    required DateTime date,
    Money? commission,
  }) async {
    try {
      emit(LoadingCreatePurchaseState());
      await _datasource.create(
        accountId: accountId,
        instrumentId: instrumentId,
        lots: lots,
        price: price,
        withdrawFundsFromBalance: withdrawFundsFromBalance,
        date: date,
        commission: commission,
      );
      emit(SuccessCreatePurchaseState());
    } catch (error) {
      final message = getErrorMessage(error);
      emit(FailureCreatePurchaseState(message: message));
    }
  }
}
