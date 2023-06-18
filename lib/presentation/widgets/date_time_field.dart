import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../core/utils/formaters/format_date_to_string.dart';
import '../../core/utils/formaters/format_time_to_string.dart';
import '../../core/utils/modals_utils/show_calendar.dart';
import '../../core/utils/modals_utils/show_clock.dart';
import 'pressable_field.dart';

class DateTimeField extends HookWidget {
  final ValueNotifier<DateTime> dateState;
  final ValueNotifier<TimeOfDay> timeState;
  const DateTimeField({
    super.key,
    required this.dateState,
    required this.timeState,
  });

  @override
  Widget build(BuildContext context) {
    final onPressDateField = useCallback(
      () {
        showCalendar(context, currentDate: dateState.value).then((value) {
          if (value != null) {
            dateState.value = value;
          }
        });
      },
      [dateState.value],
    );

    final onPressTimeField = useCallback(
      () {
        showClock(context, currentTime: timeState.value).then((value) {
          if (value != null) {
            timeState.value = value;
          }
        });
      },
      [timeState.value],
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: PressableTextField(
            controller: TextEditingController(
              text: formatDateToString(dateState.value),
            ),
            label: 'Дата',
            onPress: onPressDateField,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: PressableTextField(
            controller: TextEditingController(
              text: formatTimeToString(timeState.value),
            ),
            label: 'Время',
            onPress: onPressTimeField,
          ),
        ),
      ],
    );
  }
}
