// ignore: constant_identifier_names
const int NANO_VALUE = 1000000000;

class Money {
  int units;
  int nano;

  Money({
    required this.units,
    required this.nano,
  });

  factory Money.fromJson(Map<String, dynamic> json) {
    return Money(
      units: json['units'],
      nano: json['nano'],
    );
  }

  factory Money.fromString(String str) {
    final items = str.split('.');

    return Money(
      units: int.parse(items.first),
      nano: items.length == 1 ? 0 : int.parse(items.last),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'units': units,
      'nano': nano,
    };
  }

  Money subtraction(Money b) {
    final needAdditionalOne = b.nano > this.nano;
    final nano = this.nano - b.nano + (needAdditionalOne ? NANO_VALUE : 0);
    final units = this.units - b.units - (needAdditionalOne ? 1 : 0);
    return Money(nano: nano, units: units);
  }

  Money summ(Money b) {
    final nanoTemplate = this.nano + b.nano;
    final nano = nanoTemplate % NANO_VALUE;
    final units = this.units + b.units + (nanoTemplate / NANO_VALUE).floor();
    return Money(nano: nano, units: units);
  }

  Money multiply(int n) {
    final nanoTemplate = this.nano * n;
    final nano = nanoTemplate % NANO_VALUE;
    final units = this.units * n + (nanoTemplate / NANO_VALUE).floor();
    return Money(units: units, nano: nano);
  }

  num toNum() {
    if (nano == 0) {
      return units;
    }
    return units + nano / NANO_VALUE;
  }

  @override
  String toString() {
    final num = toNum();
    return num.toString();
  }
}
