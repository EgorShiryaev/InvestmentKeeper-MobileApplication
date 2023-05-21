import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../cubits/check_is_user_exists_cubit/check_is_user_exists_cubit.dart';
import '../../cubits/check_is_user_exists_cubit/check_is_user_exists_state.dart';
import '../loading_mask.dart';

class EnterPhoneNumberLoadingMask extends HookWidget {
  const EnterPhoneNumberLoadingMask({super.key});

  @override
  Widget build(BuildContext context) {
    final visibilityState = useState(false);

    final cubitState = Get.find<CheckIsUserExistsCubit>().state;

    useEffect(() {
      visibilityState.value = cubitState is LoadingCheckIsUserExistsState;
    }, [cubitState]);

    useEffect(() {
      if (cubitState is ErrorCheckIsUserExistsState) {
        Get.snackbar('Произошла ошибка!', cubitState.message);
      }
    }, [cubitState]);

    return LoadingMask(isVisibility: visibilityState.value);
  }
}
