import 'dart:math';

double roundDouble(double value) {
  final mod = pow(10.0, 2);
  return (value * mod).round().toDouble() / mod;
}

