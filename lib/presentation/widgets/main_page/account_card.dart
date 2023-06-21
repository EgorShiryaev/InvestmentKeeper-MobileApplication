import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/account.dart';
import '../../cubits/user_accounts_cubit/user_accounts_cubit.dart';
import '../../pages/account_page.dart';
import '../../pages/arguments/account_page_arguments.dart';
import 'account_status.dart';
import 'currency_deposit_view.dart';
import 'investment_asset_price_view.dart';
import 'investment_asset_view.dart';

class AccountCard extends StatelessWidget {
  final Account account;
  const AccountCard({super.key, required this.account});

  void navigateToAccountPage() {
    Get.find<UserAccountsCubit>().unsubscrubeToPrice();
    Get.toNamed(
      AccountPage.routeName,
      arguments: AccountPageArguments(account: account),
    )!
        .then((_) {
      Get.find<UserAccountsCubit>().load();
      Get.find<UserAccountsCubit>().subscribeToPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bodyMeduimStyle = Theme.of(context).textTheme.bodyMedium;
    return Card(
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
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
                      InvestmentAssetPriceView(
                        currency: account.currency,
                        price: account.totalMoneyValue,
                      ),
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
                  return InvestmentAssetView(item: item);
                }),
              ),
              const Divider(),
              Column(
                children:
                    List.generate(account.currencyDeposits.length, (index) {
                  final item = account.currencyDeposits[index];
                  return CurrencyDepositView(currencyDeposit: item);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
