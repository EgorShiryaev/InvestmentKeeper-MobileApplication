import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return GetMaterialApp(
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
      ],
    );
  }
}
