import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/get_error_message.dart';
import '../../../data/datasources/sales_datasource/sales_datasource.dart';
import '../../../domain/entities/money.dart';
import 'create_sale_state.dart';

class CreateSaleCubit extends Cubit<CreateSaleState> {
  final SalesDatasource _datasource;
  CreateSaleCubit({required SalesDatasource datasource})
      : _datasource = datasource,
        super(InitialCreateSaleState());

  Future<void> create({
    required int accountId,
    required int instrumentId,
    required int lots,
    required Money price,
    required bool depositFundsToAccount,
    required DateTime date,
    Money? commission,
  }) async {
    try {
      emit(LoadingCreateSaleState());
      await _datasource.create(
        accountId: accountId,
        instrumentId: instrumentId,
        lots: lots,
        price: price,
        addFundsFromSaleToBalance: depositFundsToAccount,
        date: date,
        commission: commission,
      );
      emit(SuccessCreateSaleState());
    } catch (error) {
      final message = getErrorMessage(error);
      emit(FailureCreateSaleState(message: message));
    }
  }
}
