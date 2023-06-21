import 'package:flutter/material.dart';

import '../../../domain/entities/candle_chart_size.dart';
import '../../themes/app_theme.dart';

class ChartSizeSelector extends StatelessWidget {
  final ValueNotifier<CandleChartSize> selectedValue;
  const ChartSizeSelector({super.key, required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    const items = CandleChartSize.values;
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: AppTheme.horizontalPagePadding,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isFirst = index == 0;
          return Padding(
            padding: EdgeInsets.only(left: isFirst ? 0 : 8),
            child: FilterChip(
              side: BorderSide.none,
              elevation: 3,
              label: Text('$item'),
              selected: selectedValue.value == item,
              onSelected: (value) {
                if (value) {
                  selectedValue.value = item;
                }
              },
            ),
          );
        },
      ),
    );
  }
}
