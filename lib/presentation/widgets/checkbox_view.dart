import 'package:flutter/material.dart';

class CheckBoxView extends StatelessWidget {
  final bool value;
  final void Function(bool) onPress;
  final String label;
  const CheckBoxView({
    super.key,
    required this.value,
    required this.onPress,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge;
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onTap: () => onPress(!value),
      child: Row(
        children: [
          Checkbox(
            value: value,
            // ignore: use_if_null_to_convert_nulls_to_bools
            onChanged: (value) => onPress(value == true),
          ),
          Text(
            label,
            style: style,
          ),
        ],
      ),
    );
  }
}
