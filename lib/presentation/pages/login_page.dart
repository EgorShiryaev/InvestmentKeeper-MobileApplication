import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../cubits/login_cubit/login_state.dart';
import '../widgets/loading_mask.dart';
import '../widgets/login/login_app_bar.dart';
import '../widgets/login/login_form.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  static String routeName = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ErrorAuthState) {
          Get.snackbar('Произошла ошибка!', state.message);
        } else if (state is UserIsAuthState) {
          Get.offAllNamed(HomePage.routeName);
        }
      },
      child: BlocProvider<LoginCubit>(
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
                  if (state is SuccessLoginState) {
                    BlocProvider.of<AuthCubit>(context).login(state.data);
                  } else if (state is ErrorLoginState) {
                    Get.snackbar('Произошла ошибка!', state.message);
                  } else if (state is FailureLoginState) {
                    Get.snackbar(
                      'Не удалось авторизоваться!',
                      'Повторите попытку',
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
