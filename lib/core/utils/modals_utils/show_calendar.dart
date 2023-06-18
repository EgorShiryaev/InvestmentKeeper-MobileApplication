import 'package:flutter/material.dart';

final firstDate = DateTime(1950);

Future<DateTime?> showCalendar(
  BuildContext context, {
  required DateTime? currentDate,
}) {
  final lastDate = DateTime.now();
  final initialDate = DateTime.now();

  return showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    currentDate: currentDate ?? initialDate,
  );
}
