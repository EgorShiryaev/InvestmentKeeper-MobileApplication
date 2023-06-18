import 'package:flutter/material.dart';

final firstDate = DateTime(1950);

Future<DateTime?> showCalendar(
  BuildContext context, {
  required DateTime currentDate,
}) {
  final lastDate = DateTime.now();

  return showDatePicker(
    context: context,
    initialDate: currentDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );
}
