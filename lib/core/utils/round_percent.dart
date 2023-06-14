import 'dart:math';

double roundPercent(double value) {
  final mod = pow(10.0, 2);
  return (value * mod).round().toDouble() / mod;
}
