import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';
import '../scroll_under_flexible_space.dart';

class CreatePurchaseAppBar extends StatelessWidget {
  const CreatePurchaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      scrolledUnderElevation: AppTheme.sliverAppBarScrolledUnderElevation,
      flexibleSpace: const SafeArea(
        top: false,
        bottom: false,
        child: LargeSliverAppBarFlexibleSpace(
          collapsedTitle: Text('Покупка'),
        ),
      ),
    );
  }
}
