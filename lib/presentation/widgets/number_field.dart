import 'package:flutter/material.dart';

import '../../core/settings/number_formatter.dart';
import '../../core/utils/validators/number_validator.dart';

class NumberField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  const NumberField({
    super.key,
    required this.controller,
    required this.label,
    required this.focusNode,
  });

  void decrement() {
    final value = int.parse(controller.text);
    if (value <= 0) {
      return;
    }
    final newValue = (value - 1).toString();

    controller.value = TextEditingValue(
      text: newValue,
      selection: TextSelection.collapsed(offset: newValue.length),
    );
  }

  void increment() {
    final newValue = (int.parse(controller.text) + 1).toString();
    controller.value = TextEditingValue(
      text: newValue,
      selection: TextSelection.collapsed(offset: newValue.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: IconButton(
          onPressed: decrement,
          icon: const Icon(Icons.remove_rounded),
        ),
        suffixIcon: IconButton(
          onPressed: increment,
          icon: const Icon(Icons.add_rounded),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [NumberFormatter()],
      validator: numberValidator,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }
}
