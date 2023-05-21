import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../widgets/custom_sliver_safe_area.dart';
import '../widgets/login/login_app_bar.dart';
import '../widgets/login/login_form.dart';
import '../widgets/login/login_loading_mask.dart';
import 'main_page.dart';

class LoginPage extends HookWidget {
  static String routeName = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitState = Get.find<AuthCubit>().state;
    useEffect(() {
      if (cubitState is ErrorAuthState) {
        Get.snackbar('Произошла ошибка!', cubitState.message);
      } else if (cubitState is UserIsAuthState) {
        Get.offAllNamed(MainPage.routeName);
      }
    }, [cubitState]);

    return Scaffold(
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
    );
  }
}
