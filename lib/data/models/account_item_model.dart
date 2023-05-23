// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/instrument.dart';

part 'account_item_model.g.dart';

@JsonSerializable()
class AccountItemModel {
  final int id;
  final int lots;
  final double averagePurchasePrice;
  final double currentPrice;
  final Instrument instrument;

  AccountItemModel({
    required this.id,
    required this.lots,
    required this.averagePurchasePrice,
    required this.currentPrice,
    required this.instrument,
  });

  factory AccountItemModel.fromJson(Map<String, dynamic> json) =>
      _$AccountItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountItemModelToJson(this);
}
