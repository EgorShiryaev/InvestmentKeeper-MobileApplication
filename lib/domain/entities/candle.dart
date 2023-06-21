import 'money.dart';

class Candle {
  final num open;
  final num close;
  final num high;
  final num low;
  final int volume;
  final DateTime time;
  final bool isComplete;

  Candle({
    required this.open,
    required this.close,
    required this.high,
    required this.low,
    required this.volume,
    required this.time,
    required this.isComplete,
  });

  factory Candle.fromJson(Map<String, dynamic> json) {
    final open = Money.fromJson(json['open']);
    final close = Money.fromJson(json['close']);
    final high = Money.fromJson(json['high']);
    final low = Money.fromJson(json['low']);
    final time = DateTime.parse(json['time']);

    return Candle(
      open: open.toNum(),
      close: close.toNum(),
      high: high.toNum(),
      low: low.toNum(),
      volume: json['volume'],
      time: time,
      isComplete: json['isComplete'],
    );
  }
}
