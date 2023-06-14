import 'package:flutter/services.dart';

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final buffer = StringBuffer();
    String text = newValue.text;
    if (text.startsWith('0') && text.length > 1) {
      text = text.substring(1);
    }
    for (final element in text.split('')) {
      buffer.write(element);
    }
    if (buffer.isEmpty) {
      buffer.write('0');
    }
    final newText = buffer.toString();
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
