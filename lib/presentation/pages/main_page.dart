import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';

import '../cubits/user_accounts_cubit/user_accounts_cubit.dart';
import '../widgets/main_page/main_page_app_bar.dart';
import '../widgets/main_page/main_page_body.dart';
import 'create_account_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const routeName = '/main';

  void navigateToCreateAccountPage() {
    Get.find<UserAccountsCubit>().unsubscrubeToPrice();
    Get.toNamed(CreateAccountPage.routeName)!
        .then((value) => Get.find<UserAccountsCubit>().subscribeToPrice());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserAccountsCubit>(
      create: (context) => Get.find<UserAccountsCubit>()
        ..subscribeToPrice()
        ..load(),
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) {
            return [const MainPageAppBar()];
          },
          body: const MainPageBody(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: navigateToCreateAccountPage,
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
