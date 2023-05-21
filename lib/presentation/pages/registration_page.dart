import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../cubits/registration_cubit/registration_cubit.dart';
import '../cubits/registration_cubit/registration_state.dart';
import '../widgets/loading_mask.dart';
import '../widgets/registration/registration_app_bar.dart';
import '../widgets/registration/registration_form.dart';
import 'home_page.dart';

class RegistrationPage extends StatelessWidget {
  static String routeName = '/registration';

  const RegistrationPage({super.key});

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
      child: BlocProvider<RegistrationCubit>(
        create: (_) => Get.find(),
        child: Scaffold(
          body: Stack(
            children: [
              const CustomScrollView(
                slivers: [
                  RegistrationAppBar(),
                  RegistrationForm(),
                ],
              ),
              BlocConsumer<RegistrationCubit, RegistrationState>(
                builder: (context, state) {
                  return LoadingMask(
                    showed: state is LoadingRegistrationState,
                  );
                },
                listener: (context, state) {
                  if (state is SuccessRegistrationState) {
                    BlocProvider.of<AuthCubit>(context).login(state.data);
                  } else if (state is ErrorRegistrationState) {
                    Get.snackbar('Произошла ошибка!', state.message);
                  } else if (state is UserIsAlreadyExistsRegistrationState) {
                    Get.snackbar(
                      'Проверьте введенные данные',
                      'Пользователь с таким номертом телефона уже существует',
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
