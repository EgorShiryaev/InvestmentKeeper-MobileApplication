import 'package:flutter/services.dart';

final numberRegExp = RegExp(r'^[0-9.]+$');

class PriceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final buffer = StringBuffer();
    if (newValue.text[0] == '.') {
      buffer.write(0);
    }
    for (final element in newValue.text.split('')) {
      if (element == '.' && buffer.toString().contains('.')) {
        continue;
      }
      if (numberRegExp.hasMatch(element)) {
        buffer.write(element);
      }
    }
    if (!buffer.toString().contains(' ')) {
      buffer.write(' ');
    }
    if (!buffer.toString().contains('₽')) {
      buffer.write('₽');
    }

    final newText = buffer.toString();
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length - 2),
    );
  }
}
