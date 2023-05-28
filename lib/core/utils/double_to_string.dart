String doubleToString(double num) {
  if (num.round() == num) {
    return num.round().toString();
  } else if (num.toStringAsFixed(1) == num.toString()) {
    return num.toStringAsFixed(1);
  }
  return num.toStringAsFixed(2);
}
