import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/registration_cubit/registration_cubit.dart';
import '../cubits/registration_cubit/registration_state.dart';
import '../widgets/loading_mask.dart';
import '../widgets/registration/registration_app_bar.dart';
import '../widgets/registration/registration_form.dart';

class RegistrationPage extends StatelessWidget {
  static String routeName = '/registration';

  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationCubit>(
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
                if (state is ErrorRegistrationState) {
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
    );
  }
}
