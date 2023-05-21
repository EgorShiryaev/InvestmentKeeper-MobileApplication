import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../cubits/check_is_user_exists_cubit/check_is_user_exists_cubit.dart';
import '../cubits/check_is_user_exists_cubit/check_is_user_exists_state.dart';
import '../widgets/enter_phone_number/enter_phone_number_app_bar.dart';
import '../widgets/enter_phone_number/enter_phone_number_form.dart';
import '../widgets/loading_mask.dart';
import 'home_page.dart';

class EnterPhoneNumberPage extends StatelessWidget {
  static String routeName = '/enterPhoneNumber';

  const EnterPhoneNumberPage({super.key});

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
      child: BlocProvider<CheckIsUserExistsCubit>(
        create: (_) => Get.find(),
        child: Scaffold(
          body: Stack(
            children: [
              const CustomScrollView(
                slivers: [
                  EnterPhoneNumberAppBar(),
                  EnterPhoneNumberForm(),
                ],
              ),
              BlocConsumer<CheckIsUserExistsCubit, CheckIsUserExistsState>(
                builder: (context, state) {
                  return LoadingMask(
                    showed: state is LoadingCheckIsUserExistsState,
                  );
                },
                listener: (context, state) {
                  if (state is ErrorCheckIsUserExistsState) {
                    Get.snackbar('Произошла ошибка!', state.message);
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
