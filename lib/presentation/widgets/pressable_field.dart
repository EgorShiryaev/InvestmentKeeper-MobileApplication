import 'package:flutter/material.dart';

import '../../core/utils/validators/empty_value_validator.dart';

class PressableTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPress;
  final String label;
  const PressableTextField({
    super.key,
    required this.controller,
    required this.onPress,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(labelText: label),
          validator: emptyValueValidator,
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
              ),
              onTap: onPress,
              splashColor: Colors.white.withOpacity(0.25),
            ),
          ),
        ),
      ],
    );
  }
}
