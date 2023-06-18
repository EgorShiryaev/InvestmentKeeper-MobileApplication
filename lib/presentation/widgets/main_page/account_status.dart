import 'package:flutter/material.dart';

import '../../../core/utils/get_profit_color.dart';
import '../../../domain/entities/account_entity.dart';
import '../profit_widget.dart';

class AccountStatus extends StatelessWidget {
  final AccountEntity account;
  const AccountStatus({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = getProfitBackgroundColor(account.profit);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        child: ProfitWidget(
          profit: account.profit,
          profitPercent: account.profitPercent,
          currency: account.currency,
        ),
      ),
    );
  }
}
