import 'package:flutter/material.dart';

import '../../../domain/entities/account_entity.dart';
import '../main_page/account_status.dart';

class AccountExpandedTitle extends StatelessWidget {
  final AccountEntity account;
  const AccountExpandedTitle({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final priceStyle = Theme.of(context).textTheme.headlineMedium;

    final totalPrice =
        (account.balance + account.currentPrice).toStringAsFixed(2);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(account.title, style: titleStyle),
            Text('$totalPrice ₽', style: priceStyle),
          ],
        ),
        AccountStatus(account: account),
      ],
    );
  }
}
