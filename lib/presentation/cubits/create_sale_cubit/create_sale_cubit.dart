import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/exception_impl.dart';
import '../../../data/datasources/sales_datasource/sales_datasource.dart';
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
    required double price,
    required bool withdrawFundsFromBalance,
    required DateTime date,
    double? commission,
  }) async {
    try {
      emit(LoadingCreateSaleState());
      await _datasource.create(
        accountId: accountId,
        instrumentId: instrumentId,
        lots: lots,
        price: price,
        addFundsFromSaleToBalance: withdrawFundsFromBalance,
        date: date,
        commission: commission,
      );
      emit(SuccessCreateSaleState());
    } catch (error) {
      final message = error is ExceptionImpl ? error.message : error.toString();
      emit(FailureCreateSaleState(message: message));
    }
  }
}
