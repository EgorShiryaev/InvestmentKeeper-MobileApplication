import 'package:flutter/material.dart';

import '../../../domain/entities/account.dart';
import '../main_page/account_status.dart';
import '../money_widget.dart';

class AccountExpandedTitle extends StatelessWidget {
  final num price;
  final Account account;
  const AccountExpandedTitle({
    super.key,
    required this.account,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final priceStyle = Theme.of(context).textTheme.headlineMedium;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(account.title, style: titleStyle),
            MoneyWidget(
              currency: account.currency,
              value: price,
              textStyle: priceStyle,
            ),
          ],
        ),
        AccountStatus(account: account),
      ],
    );
  }
}
