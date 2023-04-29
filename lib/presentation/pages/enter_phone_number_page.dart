import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/check_is_user_exists_cubit/check_is_user_exists_cubit.dart';
import '../cubits/check_is_user_exists_cubit/check_is_user_exists_state.dart';
import '../widgets/enter_phone_number/enter_phone_number_app_bar.dart';
import '../widgets/enter_phone_number/enter_phone_number_form.dart';
import '../widgets/loading_mask.dart';

class EnterPhoneNumberPage extends StatelessWidget {
  static String routeName = '/';

  const EnterPhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckIsUserExistsCubit>(
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
    );
  }
}
