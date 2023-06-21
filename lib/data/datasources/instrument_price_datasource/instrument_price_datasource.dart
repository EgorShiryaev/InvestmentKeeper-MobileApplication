import '../../../domain/entities/money.dart';

abstract class InstrumentPriceDatasource {
  Future<Money> get(int instrumentId);
}
