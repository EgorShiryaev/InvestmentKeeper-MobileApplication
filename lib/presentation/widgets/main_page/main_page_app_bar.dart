import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../themes/app_theme.dart';
import '../scroll_under_flexible_space.dart';

class MainPageAppBar extends StatelessWidget {
  const MainPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      scrolledUnderElevation: AppTheme.sliverAppBarScrolledUnderElevation,
      flexibleSpace: const SafeArea(
        top: false,
        bottom: false,
        child: LargeSliverAppBarFlexibleSpace(
          collapsedTitle: Text('Главная'),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout_rounded),
          onPressed: () => BlocProvider.of<AuthCubit>(context).logout(),
        )
      ],
    );
  }
}
