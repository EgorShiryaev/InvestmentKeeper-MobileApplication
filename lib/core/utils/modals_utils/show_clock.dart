import 'package:flutter/material.dart';

Future<TimeOfDay?> showClock(
  BuildContext context, {
  required TimeOfDay? currentTime,
}) {
  return showTimePicker(
    context: context,
    initialTime: currentTime ?? TimeOfDay.now(),
  );
}
