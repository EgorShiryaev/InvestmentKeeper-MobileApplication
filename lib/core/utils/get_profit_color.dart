import 'dart:ui';

const notProfitBackgroundColor = Color(0xFFE4E2E6);
const lossBackgroundColor = Color(0x33B20000);
const profitBackgroundColor = Color(0x3300B200);

const notProfitTextColor = Color(0xFF767680);
const lossTextColor = Color(0xFFB20000);
const profitTextColor = Color(0xFF00B200);

Color getProfitBackgroundColor(num profit) {
  if (profit == 0) {
    return notProfitBackgroundColor;
  } else if (profit < 0) {
    return lossBackgroundColor;
  } else if (profit > 0) {
    return profitBackgroundColor;
  }
  return notProfitBackgroundColor;
}

Color getProfitTextColor(num profit) {
  if (profit == 0) {
    return notProfitTextColor;
  } else if (profit < 0) {
    return lossTextColor;
  } else if (profit > 0) {
    return profitTextColor;
  }
  return notProfitTextColor;
}
