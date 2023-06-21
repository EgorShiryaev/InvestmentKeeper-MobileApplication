import 'package:flutter/material.dart';

import '../../../domain/entities/currency_deposit.dart';
import '../../themes/app_theme.dart';
import '../main_page/currency_deposit_view.dart';

class StructureCurrencyView extends StatelessWidget {
  final String title;
  final List<CurrencyDeposit> items;
  const StructureCurrencyView({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineSmall;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppTheme.horizontalPagePadding,
            child: Text(title, style: titleStyle),
          ),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(items.length, (index) {
              final item = items[index];
              const verticalPadding = 4.0;
              return Padding(
                padding: AppTheme.horizontalPagePadding.copyWith(
                  top: verticalPadding,
                  bottom: verticalPadding,
                ),
                child: CurrencyDepositView(currencyDeposit: item),
              );
            }),
          )
        ],
      ),
    );
  }
}
