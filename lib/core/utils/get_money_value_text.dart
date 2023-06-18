String getMoneyValueText(double value) {
  if (value == value.floor()) {
    return value.toStringAsFixed(0);
  } else if ((value * 10) == (value * 10).floor()) {
    return value.toStringAsFixed(1);
  }
  return value.toStringAsFixed(2);
}
