import '../../../domain/entities/instrument.dart';

abstract class InstrumentsDatasource {
  Future<List<Instrument>> search(String query);
}
