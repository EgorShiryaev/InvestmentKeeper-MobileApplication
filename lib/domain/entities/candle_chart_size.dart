enum CandleChartSize {
  day,
  threeDays,
  week,
  month,
  sixMonth,
  year;

  @override
  String toString() {
    switch (this) {
      case CandleChartSize.day:
        return 'День';
      case CandleChartSize.threeDays:
        return '3 дня';
      case CandleChartSize.week:
        return 'Неделя';
      case CandleChartSize.month:
        return 'Месяц';
      case CandleChartSize.sixMonth:
        return '6 месяцев';
      case CandleChartSize.year:
        return 'Год';
    }
  }
}
