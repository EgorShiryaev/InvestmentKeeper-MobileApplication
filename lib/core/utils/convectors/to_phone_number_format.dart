import '../../settings/phone_number_format.dart';

String toPhoneNumberFormat(String value) {
  final buffer = StringBuffer(PhoneNumberFormat.code);
  final length = value.length > PhoneNumberFormat.mask.length
      ? PhoneNumberFormat.mask.length
      : value.length;
  for (var i = 2; i < length; i++) {
    if (i == length - 1 && int.tryParse(value[i]) == null) {
      continue;
    } else if (PhoneNumberFormat.mask[i] == value[i]) {
      buffer.write(PhoneNumberFormat.mask[i]);
    } else if (PhoneNumberFormat.mask[i] == PhoneNumberFormat.placeholderChar) {
      buffer.write(value[i]);
    } else {
      buffer
        ..write(PhoneNumberFormat.mask[i])
        ..write(value[i]);
    }
  }
  return buffer.toString();
}
