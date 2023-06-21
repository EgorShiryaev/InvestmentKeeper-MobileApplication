import '../../../domain/entities/account.dart';
import '../../../domain/entities/instrument.dart';

class CreatePurchasePageArguments {
  final Account account;
  final Instrument? instrument;

  CreatePurchasePageArguments({
    required this.account,
    this.instrument,
  });
}
