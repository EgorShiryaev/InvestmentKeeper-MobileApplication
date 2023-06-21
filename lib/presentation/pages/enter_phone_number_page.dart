import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../core/utils/modals_utils/show_error_snackbar.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../cubits/check_is_user_exists_cubit/check_is_user_exists_cubit.dart';
import '../widgets/custom_sliver_safe_area.dart';
import '../widgets/enter_phone_number/enter_phone_number_app_bar.dart';
import '../widgets/enter_phone_number/enter_phone_number_form.dart';
import '../widgets/enter_phone_number/enter_phone_number_loading_mask.dart';
import 'main_page.dart';

class EnterPhoneNumberPage extends StatelessWidget {
  const EnterPhoneNumberPage({super.key});

  static const routeName = '/enterPhoneNumber';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ErrorAuthState) {
          showErrorSnackbar(state.message);
        } else if (state is UserIsAuthState) {
          Get.offAllNamed(MainPage.routeName);
        }
      },
      child: BlocProvider<CheckIsUserExistsCubit>(
        create: (context) => Get.find(),
        child: Scaffold(
          body: Stack(
            children: const [
              CustomScrollView(
                slivers: [
                  EnterPhoneNumberAppBar(),
                  CustomSliverSafeArea(child: EnterPhoneNumberForm()),
                ],
              ),
              EnterPhoneNumberLoadingMask(),
            ],
          ),
        ),
      ),
    );
  }
}
