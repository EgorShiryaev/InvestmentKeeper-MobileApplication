import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';
import '../scroll_under_flexible_space.dart';

class CreateAccountAppBar extends StatelessWidget {
  const CreateAccountAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      scrolledUnderElevation: AppTheme.sliverAppBarScrolledUnderElevation,
      expandedHeight: AppTheme.sliverAppBarTitleTwoLinesTextHeight,
      flexibleSpace: const SafeArea(
        top: false,
        bottom: false,
        child: LargeSliverAppBarFlexibleSpace(
          collapsedTitle: Text('Создание брокерского счета'),
        ),
      ),
    );
  }
}
