import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import '../../cubits/login_cubit/login_state.dart';
import '../loading_mask.dart';

class LoginLoadingMask extends StatelessWidget {
  const LoginLoadingMask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          Get.find<AuthCubit>().login(state.data);
        } else if (state is ErrorLoginState) {
          Get.snackbar('Произошла ошибка!', state.message);
        } else if (state is FailureLoginState) {
          Get.snackbar(
            'Не удалось авторизоваться!',
            'Повторите попытку',
          );
        }
      },
      builder: (context, state) {
        final isVisibility = state is LoadingLoginState;
        return LoadingMask(isVisibility: isVisibility);
      },
    );
  }
}
