// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as int,
      title: json['title'] as String,
      balance: (json['balance'] as num).toDouble(),
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      profit: (json['profit'] as num).toDouble(),
      profitPercent: (json['profitPercent'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => AccountItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'balance': instance.balance,
      'purchasePrice': instance.purchasePrice,
      'currentPrice': instance.currentPrice,
      'profit': instance.profit,
      'profitPercent': instance.profitPercent,
      'items': instance.items,
    };
