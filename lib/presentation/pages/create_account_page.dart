import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/create_account_cubit/create_account_cubit.dart';
import '../widgets/create_account/create_account_app_bar.dart';
import '../widgets/create_account/create_account_form.dart';
import '../widgets/create_account/create_account_loading_mask.dart';
import '../widgets/custom_sliver_safe_area.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});
  
  static const routeName = '/createAccount';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateAccountCubit>(
      create: (context) => Get.find(),
      child: Scaffold(
        body: Stack(
          children: const [
            CustomScrollView(
              slivers: [
                CreateAccountAppBar(),
                CustomSliverSafeArea(child: CreateAccountForm()),
              ],
            ),
            CreateAccountLoadingMask()
          ],
        ),
      ),
    );
  }
}
