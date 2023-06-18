import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/registration_cubit/registration_cubit.dart';
import '../widgets/custom_sliver_safe_area.dart';
import '../widgets/registration/registration_app_bar.dart';
import '../widgets/registration/registration_form.dart';
import '../widgets/registration/registration_loading_mask.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  static const routeName = '/registration';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationCubit>(
      create: (context) => Get.find(),
      child: Scaffold(
        body: Stack(
          children: const [
            CustomScrollView(
              slivers: [
                RegistrationAppBar(),
                CustomSliverSafeArea(child: RegistrationForm()),
              ],
            ),
            RegistrationLoadingMask()
          ],
        ),
      ),
    );
  }
}
