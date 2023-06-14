import 'package:flutter/material.dart';

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
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
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
