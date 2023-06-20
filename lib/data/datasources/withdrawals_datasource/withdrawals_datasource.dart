import '../../../domain/entities/currency.dart';
import '../../../domain/entities/money.dart';

abstract class WithdrawalsDatasource {
  Future<void> create({
    required int accountId,
    required Money value,
    required Currency currency,
    required DateTime date,
  });
}
