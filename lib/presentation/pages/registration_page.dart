import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../cubits/registration_cubit/registration_cubit.dart';
import '../widgets/custom_sliver_safe_area.dart';
import '../widgets/registration/registration_app_bar.dart';
import '../widgets/registration/registration_form.dart';
import 'main_page.dart';

class RegistrationPage extends StatelessWidget {
  static String routeName = '/registration';

  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ErrorAuthState) {
          Get.snackbar('Произошла ошибка!', state.message);
        } else if (state is UserIsAuthState) {
          Get.offAllNamed(MainPage.routeName);
        }
      },
      child: BlocProvider<RegistrationCubit>(
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
            ],
          ),
        ),
      ),
    );
  }
}
