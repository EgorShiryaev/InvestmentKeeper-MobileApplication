import '../../../domain/entities/account.dart';
import '../../../domain/entities/investment_asset.dart';

class InstrumentPageArguments {
  final Account account;
  final InvestmentAsset asset;

  InstrumentPageArguments({
    required this.account,
    required this.asset,
  });
}
