import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/account_entity.dart';
import '../../pages/account_page.dart';
import '../../pages/arguments/account_page_arguments.dart';
import 'account_item_view.dart';
import 'account_status.dart';

class AccountCard extends StatelessWidget {
  final AccountEntity account;
  const AccountCard({super.key, required this.account});

  void navigateToAccountPage() {
    Get.toNamed(
      AccountPage.routeName,
      arguments: AccountPageArguments(id: account.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleMediumStyle = Theme.of(context).textTheme.titleMedium;
    final bodyMeduimStyle = Theme.of(context).textTheme.bodyMedium;
    final totalPrice =
        (account.balance + account.currentPrice).toStringAsFixed(2);
    return Card(
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: navigateToAccountPage,
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
      ),
    );
  }
}
