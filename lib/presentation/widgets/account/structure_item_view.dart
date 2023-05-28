import 'package:flutter/material.dart';

import '../../../domain/entities/investment_asset.dart';
import '../main_page/investment_asset_view.dart';

class StructureItemView extends StatelessWidget {
  final String title;
  final List<InvestmentAsset> items;
  const StructureItemView({
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
          Text(title, style: titleStyle),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(items.length, (index) {
              final item = items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: InvestmentAssetView(item: item),
              );
            }),
          )
        ],
      ),
    );
  }
}
