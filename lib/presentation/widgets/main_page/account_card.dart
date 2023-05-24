import 'package:flutter/material.dart';

import '../../../domain/entities/account.dart';
import 'account_item_view.dart';
import 'account_status.dart';

class AccountCard extends StatelessWidget {
  final Account account;
  const AccountCard({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    final titleMediumStyle = Theme.of(context).textTheme.titleMedium;
    final bodyMeduimStyle = Theme.of(context).textTheme.bodyMedium;
    final totalPrice =
        (account.balance + account.currentPrice).toStringAsFixed(2);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$totalPrice ₽', style: titleMediumStyle),
                    const SizedBox(height: 4),
                    Text(account.title, style: bodyMeduimStyle),
                  ],
                ),
                AccountStatus(account: account)
              ],
            ),
            if (account.items.isNotEmpty) const Divider(),
            Column(
              children: List.generate(account.items.length, (index) {
                final item = account.items[index];
                return AccountItemView(item: item);
              }),
            )
          ],
        ),
      ),
    );
  }
}
