import 'package:flutter/material.dart';

class LoadingMask extends StatelessWidget {
  final bool showed;
  const LoadingMask({super.key, required this.showed});

  @override
  Widget build(BuildContext context) {
    if (!showed) {
      return const SizedBox();
    }
    return Positioned.fill(
      child: ColoredBox(
        color: Theme.of(context).colorScheme.background.withOpacity(0.7),
        child: const FittedBox(
          fit: BoxFit.none,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
