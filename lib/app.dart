import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:investment_keeper/presentation/pages/create_withdrawal_page.dart';

import 'presentation/cubits/auth_cubit/auth_cubit.dart';
import 'presentation/pages/account_page.dart';
import 'presentation/pages/create_account_page.dart';
import 'presentation/pages/create_purchase_page.dart';
import 'presentation/pages/create_refill_page.dart';
import 'presentation/pages/create_sale_page.dart';
import 'presentation/pages/enter_phone_number_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/main_page.dart';
import 'presentation/pages/registration_page.dart';
import 'presentation/pages/rename_account_page.dart';
import 'presentation/pages/splash_page.dart';
import 'presentation/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => Get.find()..autoLogin(),
      child: GetMaterialApp(
        themeMode: ThemeMode.light,
        theme: AppTheme.light,
        initialRoute: SplashPage.routeName,
        getPages: [
          GetPage(
            name: SplashPage.routeName,
            page: () => const SplashPage(),
          ),
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
          GetPage(
            name: RenameAccountPage.routeName,
            page: () => const RenameAccountPage(),
          ),
          GetPage(
            name: CreatePurchasePage.routeName,
            page: () => const CreatePurchasePage(),
          ),
          GetPage(
            name: CreateSalePage.routeName,
            page: () => const CreateSalePage(),
          ),
          GetPage(
            name: CreateRefillPage.routeName,
            page: () => const CreateRefillPage(),
          ),
          GetPage(
            name: CreateWithdrawalPage.routeName,
            page: () => const CreateWithdrawalPage(),
          ),
        ],
      ),
    );
  }
}
