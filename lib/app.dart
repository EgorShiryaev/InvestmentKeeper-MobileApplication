import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'presentation/cubits/auth_cubit/auth_cubit.dart';
import 'presentation/pages/enter_phone_number_page.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/registration_page.dart';
import 'presentation/themes/app_theme.dart';

class App extends StatelessWidget {
  final bool userIsAuth;
  const App({super.key, required this.userIsAuth});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => Get.find(),
      child: GetMaterialApp(
        themeMode: ThemeMode.light,
        theme: AppTheme.light,
        initialRoute:
            userIsAuth ? HomePage.routeName : EnterPhoneNumberPage.routeName,
        getPages: [
          GetPage(
            name: HomePage.routeName,
            page: () => const HomePage(),
          ),
          GetPage(
            name: EnterPhoneNumberPage.routeName,
            page: () => const EnterPhoneNumberPage(),
          ),
          GetPage(
            name: LoginPage.routeName,
            page: () => const LoginPage(),
          ),
          GetPage(
            name: RegistrationPage.routeName,
            page: () => const RegistrationPage(),
          ),
        ],
      ),
    );
  }
}
