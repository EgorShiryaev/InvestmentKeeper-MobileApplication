enum CandleTimesize {
  hour,
  twoHours,
  fourHours,
  day,
  week,
  month;
}

const candleTimesizeMap = {
  CandleTimesize.hour: 'h',
  CandleTimesize.twoHours: '2h',
  CandleTimesize.fourHours: '4h',
  CandleTimesize.day: 'd',
  CandleTimesize.week: 'w',
  CandleTimesize.month: 'm',
};
