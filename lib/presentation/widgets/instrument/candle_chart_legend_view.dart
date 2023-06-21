import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'instrument_page_body.dart';

class CandleChartLegendView extends StatelessWidget {
  final CartesianChartPoint info;
  const CandleChartLegendView({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final x = info.x as DateTime;
    final time = DateFormat.Hm(locale).format(x);
    final date = DateFormat.yMd(locale).format(x);

    const style = TextStyle(fontSize: 12);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$date $time', style: style),
              Text('Открытие: ${info.open}', style: style),
              Text('Закрытие: ${info.close}', style: style),
              Text('Мин: ${info.low}', style: style),
              Text('Макс: ${info.high}', style: style),
            ],
          ),
        ),
      ),
    );
  }
}
