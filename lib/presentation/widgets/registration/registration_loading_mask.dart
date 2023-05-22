import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../cubits/registration_cubit/registration_cubit.dart';
import '../../cubits/registration_cubit/registration_state.dart';
import '../loading_mask.dart';

class LoginLoadingMask extends HookWidget {
  const LoginLoadingMask({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is SuccessRegistrationState) {
          Get.find<AuthCubit>().login(state.data);
        } else if (state is ErrorRegistrationState) {
          Get.snackbar('Произошла ошибка!', state.message);
        } else if (state is UserIsAlreadyExistsRegistrationState) {
          Get.snackbar(
            'Проверьте введенные данные',
            'Пользователь с таким номером телефона уже существует',
          );
        }
      },
      builder: (context, state) {
        final isVisibility = state is LoadingRegistrationState;
        return LoadingMask(isVisibility: isVisibility);
      },
    );
  }
}
