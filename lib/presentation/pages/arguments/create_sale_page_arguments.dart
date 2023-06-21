import '../../../domain/entities/account.dart';
import '../../../domain/entities/instrument.dart';

class CreateSalePageArguments {
  final Account account;
  final Instrument? instrument;

  CreateSalePageArguments({
    required this.account,
    this.instrument,
  });
}
