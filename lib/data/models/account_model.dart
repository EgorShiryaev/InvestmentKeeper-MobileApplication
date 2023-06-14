// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/currency.dart';
import '../../domain/entities/currency_deposit.dart';
import '../../domain/entities/investment_asset.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  final int id;
  final String title;
  final double purchasePrice;
  final double currentPrice;
  final List<InvestmentAsset> items;
  final List<CurrencyDeposit> currencyDeposits;
  final Currency currency;

  AccountModel( {
    required this.id,
    required this.title,
    required this.purchasePrice,
    required this.currentPrice,
    required this.items,
    required this.currencyDeposits,
    required this.currency,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
