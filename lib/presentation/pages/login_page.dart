import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../cubits/login_cubit/login_cubit.dart';
import '../cubits/login_cubit/login_state.dart';
import '../widgets/loading_mask.dart';
import '../widgets/login/login_app_bar.dart';
import '../widgets/login/login_form.dart';
import 'arguments/login_page_arguments.dart';

class LoginPage extends StatelessWidget {
  static String routeName = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (_) => Get.find(),
      child: Scaffold(
        body: Stack(
          children: [
            const CustomScrollView(
              slivers: [
                LoginAppBar(),
                LoginForm(),
              ],
            ),
            BlocConsumer<LoginCubit, LoginState>(
              builder: (context, state) {
                return LoadingMask(
                  showed: state is LoadingLoginState,
                );
              },
              listener: (context, state) {
                if (state is ErrorLoginState) {
                  Get.snackbar('Произошла ошибка!', state.message);
                } else if (state is FailureLoginState) {
                  Get.snackbar('Не удалось авторизоваться!', state.message);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
