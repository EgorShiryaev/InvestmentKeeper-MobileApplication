import '../../../domain/entities/currency.dart';

abstract class RefillsDatasource {
  Future<void> create({
    required int accountId,
    required double value,
    required Currency currency,
    required DateTime date,
  });
}
