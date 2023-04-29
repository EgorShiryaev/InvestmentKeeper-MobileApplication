import 'package:flutter/services.dart';

import 'phone_number_format.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  final String code;
  final String mask;
  final String placeholderChar;

  PhoneNumberFormatter()
      : code = PhoneNumberFormat.code,
        mask = PhoneNumberFormat.mask,
        placeholderChar = PhoneNumberFormat.placeholderChar;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final buffer = StringBuffer(code);
    final text = newValue.text;
    final length = text.length > mask.length ? mask.length : text.length;
    for (var i = 2; i < length; i++) {
      if (i == length - 1 && int.tryParse(text[i]) == null) {
        continue;
      } else if (mask[i] == text[i]) {
        buffer.write(mask[i]);
      } else if (mask[i] == placeholderChar) {
        buffer.write(text[i]);
      } else {
        buffer
          ..write(mask[i])
          ..write(text[i]);
      }
    }
    final newText = buffer.toString();
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
