import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../core/settings/app_settings.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../cubits/login_cubit/login_state.dart';
import 'enter_phone_number_page.dart';
import 'main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UserIsAuthState) {
          Get.offNamed(MainPage.routeName);
        } else if (state is UserIsUnauthState || state is ErrorAuthState) {
          Get.offNamed(EnterPhoneNumberPage.routeName);
        }
        if (state is! InitialAuthState || state is! LoadingLoginState) {
          if (AppSettings.splashScreenVisible) {
            Timer(
              const Duration(milliseconds: 500),
              FlutterNativeSplash.remove,
            );
          }
        }
      },
      child: const Scaffold(),
    );
  }
}
