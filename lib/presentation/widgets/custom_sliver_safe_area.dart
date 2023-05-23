import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class CustomSliverSafeArea extends StatelessWidget {
  final Widget child;
  const CustomSliverSafeArea({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      top: false,
      bottom: false,
      minimum: AppTheme.pagePadding,
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [child],
        ),
      ),
    );
  }
}
