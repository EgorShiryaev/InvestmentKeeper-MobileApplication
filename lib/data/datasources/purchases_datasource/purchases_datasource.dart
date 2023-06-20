import '../../../domain/entities/money.dart';

abstract class PurchasesDatasource {
  Future<void> create({
    required int accountId,
    required int instrumentId,
    required int lots,
    required Money price,
    required bool withdrawFundsFromBalance,
    required DateTime date,
    Money? commission,
  });
}
