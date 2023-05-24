// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/account_item_entity.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  final int id;
  final String title;
  final double balance;
  final double purchasePrice;
  final double currentPrice;
  final double profit;
  final double profitPercent;
  final List<AccountItemEntity> items;

  AccountModel({
    required this.id,
    required this.title,
    required this.balance,
    required this.purchasePrice,
    required this.currentPrice,
    required this.profit,
    required this.profitPercent,
    required this.items,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
