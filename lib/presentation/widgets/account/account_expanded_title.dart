import 'package:flutter/material.dart';

import '../../../core/utils/get_currency_char.dart';
import '../../../domain/entities/account_entity.dart';
import '../main_page/account_status.dart';

class AccountExpandedTitle extends StatelessWidget {
  final double price;
  final AccountEntity account;
  const AccountExpandedTitle({
    super.key,
    required this.account,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final priceStyle = Theme.of(context).textTheme.headlineMedium;
     final currencyChar = getCurrencyChar(account.currency);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(account.title, style: titleStyle),
            Text('$price $currencyChar', style: priceStyle),
          ],
        ),
        AccountStatus(account: account),
      ],
    );
  }
}
