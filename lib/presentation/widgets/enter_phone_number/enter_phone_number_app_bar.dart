import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';
import '../scroll_under_flexible_space.dart';

class EnterPhoneNumberAppBar extends StatelessWidget {
  const EnterPhoneNumberAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      flexibleSpace: const SafeArea(
        top: false,
        bottom: false,
        child: LargeSliverAppBarFlexibleSpace(
          collapsedTitle: Text('Введите номер телефона'),
          expandedTitle: Text('Введите\nномер телефона'),
        ),
      ),
      expandedHeight: 164,
      scrolledUnderElevation: AppTheme.sliverAppBarScrolledUnderElevation,
    );
  }
}
