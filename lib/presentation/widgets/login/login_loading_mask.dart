import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import '../../cubits/login_cubit/login_state.dart';
import '../loading_mask.dart';

class LoginLoadingMask extends HookWidget {
  const LoginLoadingMask({super.key});

  @override
  Widget build(BuildContext context) {
    final visibilityState = useState(false);

    final cubitState = Get.find<LoginCubit>().state;

    useEffect(() {
      visibilityState.value = cubitState is LoadingLoginState;
    }, [cubitState]);

    useEffect(() {
      if (cubitState is SuccessLoginState) {
       Get.find<AuthCubit>().login(cubitState.data);
      } else if (cubitState is ErrorLoginState) {
        Get.snackbar('Произошла ошибка!', cubitState.message);
      } else if (cubitState is FailureLoginState) {
        Get.snackbar(
          'Не удалось авторизоваться!',
          'Повторите попытку',
        );
      }
    }, [cubitState]);

    return LoadingMask(isVisibility: visibilityState.value);
  }
}
