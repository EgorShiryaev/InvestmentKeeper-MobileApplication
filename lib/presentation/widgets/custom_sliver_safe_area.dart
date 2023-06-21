import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class CustomSliverSafeArea extends StatelessWidget {
  final Widget child;
  final bool needPagePaddingHorizontal;
  const CustomSliverSafeArea({
    super.key,
    required this.child,
    this.needPagePaddingHorizontal = true,
  });

  @override
  Widget build(BuildContext context) {
    final padding = needPagePaddingHorizontal
        ? AppTheme.pagePadding
        : EdgeInsets.only(
            top: AppTheme.pagePadding.top,
            bottom: AppTheme.pagePadding.bottom,
          );
    return SliverSafeArea(
      top: false,
      bottom: false,
      minimum: padding,
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [child],
        ),
      ),
    );
  }
}
