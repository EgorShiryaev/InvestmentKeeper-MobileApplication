import 'add_prefix_zero.dart';

String formatDateToString(DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  }
  final day = addPrefixZero(dateTime.day);
  final month = addPrefixZero(dateTime.month);
  final year = addPrefixZero(dateTime.year);
  return '$day.$month.$year';
}
