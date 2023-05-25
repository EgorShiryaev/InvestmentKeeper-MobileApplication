import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/edit_account_cubit/edit_account_cubit.dart';
import '../widgets/custom_sliver_safe_area.dart';
import '../widgets/rename_account/rename_account_app_bar.dart';
import '../widgets/rename_account/rename_account_form.dart';
import '../widgets/rename_account/rename_account_loading_mask.dart';

class RenameAccountPage extends StatelessWidget {
  const RenameAccountPage({super.key});

  static const routeName = '/renameAccount';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditAccountCubit>(
      create: (context) => Get.find(),
      child: Scaffold(
        body: Stack(
          children: const [
            CustomScrollView(
              slivers: [
                RenameAccountAppBar(),
                CustomSliverSafeArea(child: RenameAccountForm()),
              ],
            ),
            EditAccountLoadingMask()
          ],
        ),
      ),
    );
  }
}
