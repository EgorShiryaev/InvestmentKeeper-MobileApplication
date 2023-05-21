// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'account_item.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final int id;
  final String title;
  final double balance;
  final double purchasePrice;
  final double currentPrice;
  final double profit;
  final double profitPercent;
  final List<AccountItem> items;

  Account({
    required this.id,
    required this.title,
    required this.balance,
    required this.purchasePrice,
    required this.currentPrice,
    required this.profit,
    required this.profitPercent,
    required this.items,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
