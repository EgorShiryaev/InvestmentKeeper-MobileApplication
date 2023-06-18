import 'package:flutter/material.dart';

import 'add_prefix_zero.dart';

String formatTimeToString(TimeOfDay? timeOfDay) {
  if (timeOfDay == null) {
    return '';
  }
  final hours = addPrefixZero(timeOfDay.hour);
  final minutes = addPrefixZero(timeOfDay.minute);
  return '$hours:$minutes';
}
