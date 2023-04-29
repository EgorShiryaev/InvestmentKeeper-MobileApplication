import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'presentation/pages/enter_phone_number_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/registration_page.dart';
import 'presentation/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      initialRoute: '/',
      getPages: [
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
      home: const EnterPhoneNumberPage(),
    );
  }
}
