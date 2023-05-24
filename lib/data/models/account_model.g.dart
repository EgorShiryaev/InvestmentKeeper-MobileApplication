// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      id: json['id'] as int,
      title: json['title'] as String,
      balance: (json['balance'] as num).toDouble(),
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      profit: (json['profit'] as num).toDouble(),
      profitPercent: (json['profitPercent'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => AccountItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'balance': instance.balance,
      'purchasePrice': instance.purchasePrice,
      'currentPrice': instance.currentPrice,
      'profit': instance.profit,
      'profitPercent': instance.profitPercent,
      'items': instance.items,
    };