abstract class PurchasesDatasource {
  Future<void> create({
    required int accountId,
    required int instrumentId,
    required int lots,
    required double price,
    required bool withdrawFundsFromBalance,
    required DateTime date,
    double? commission,
  });
}
