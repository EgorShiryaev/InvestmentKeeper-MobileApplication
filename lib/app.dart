import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'presentation/cubits/auth_cubit/auth_cubit.dart';
import 'presentation/pages/account_page.dart';
import 'presentation/pages/create_account_page.dart';
import 'presentation/pages/enter_phone_number_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/main_page.dart';
import 'presentation/pages/registration_page.dart';
import 'presentation/themes/app_theme.dart';

class App extends StatelessWidget {
  final bool userIsAuth;
  const App({super.key, required this.userIsAuth});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => Get.find(),
      child: GetMaterialApp(
        themeMode: ThemeMode.light,
        theme: AppTheme.light,
        initialRoute:
            userIsAuth ? MainPage.routeName : EnterPhoneNumberPage.routeName,
        getPages: [
          GetPage(
            name: MainPage.routeName,
            page: () => const MainPage(),
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
          GetPage(
            name: CreateAccountPage.routeName,
            page: () => const CreateAccountPage(),
          ),
          GetPage(
            name: AccountPage.routeName,
            page: () => const AccountPage(),
          ),
        ],
      ),
    );
  }
}
