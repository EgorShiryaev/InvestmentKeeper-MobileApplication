// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'instrument.dart';

part 'account_item.g.dart';

@JsonSerializable()
class AccountItem {
  final int id;
  final int lots;
  final double averagePurchasePrice;
  final double currentPrice;
  final Instrument instrument;

  AccountItem({
    required this.id,
    required this.lots,
    required this.averagePurchasePrice,
    required this.currentPrice,
    required this.instrument,
  });

  factory AccountItem.fromJson(Map<String, dynamic> json) =>
      _$AccountItemFromJson(json);

  Map<String, dynamic> toJson() => _$AccountItemToJson(this);
}
