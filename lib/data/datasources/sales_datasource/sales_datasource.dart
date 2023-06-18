abstract class SalesDatasource {
  Future<void> create({
    required int accountId,
    required int instrumentId,
    required int lots,
    required double price,
    required bool addFundsFromSaleToBalance,
    required DateTime date,
    double? commission,
  });
}
