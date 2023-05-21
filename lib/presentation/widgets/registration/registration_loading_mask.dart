import 'package:flutter/material.dart';
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
    final visibilityState = useState(false);

    final cubitState = Get.find<RegistrationCubit>().state;

    useEffect(() {
      visibilityState.value = cubitState is LoadingRegistrationState;
    }, [cubitState]);

    useEffect(() {
      if (cubitState is SuccessRegistrationState) {
        Get.find<AuthCubit>().login(cubitState.data);
      } else if (cubitState is ErrorRegistrationState) {
        Get.snackbar('Произошла ошибка!', cubitState.message);
      } else if (cubitState is UserIsAlreadyExistsRegistrationState) {
        Get.snackbar(
          'Проверьте введенные данные',
          'Пользователь с таким номером телефона уже существует',
        );
      }
    }, [cubitState]);

    return LoadingMask(isVisibility: visibilityState.value);
  }
}
