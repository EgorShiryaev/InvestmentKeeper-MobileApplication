import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/login_cubit/login_cubit.dart';
import '../widgets/custom_sliver_safe_area.dart';
import '../widgets/login/login_app_bar.dart';
import '../widgets/login/login_form.dart';
import '../widgets/login/login_loading_mask.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => Get.find(),
      child: Scaffold(
        body: Stack(
          children: const [
            CustomScrollView(
              slivers: [
                LoginAppBar(),
                CustomSliverSafeArea(child: LoginForm()),
              ],
            ),
            LoginLoadingMask()
          ],
        ),
      ),
    );
  }
}
