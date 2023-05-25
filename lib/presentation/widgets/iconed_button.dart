import 'package:flutter/material.dart';

class IconedButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function() onPress;
  const IconedButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.bodyLarge;
    return InkWell(
      onTap: onPress,
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: SizedBox(
          height: 48,
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: labelStyle,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.keyboard_arrow_right_rounded)
            ],
          ),
        ),
      ),
    );
  }
}
