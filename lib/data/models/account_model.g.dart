// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      id: json['id'] as int,
      title: json['title'] as String,
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => InvestmentAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
      currencyDeposits: (json['currencyDeposits'] as List<dynamic>)
          .map((e) => CurrencyDeposit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'purchasePrice': instance.purchasePrice,
      'currentPrice': instance.currentPrice,
      'items': instance.items,
      'currencyDeposits': instance.currencyDeposits,
    };
