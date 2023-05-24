import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/accounts_cubit/user_accounts_cubit.dart';
import '../widgets/main_page/create_account_button.dart';
import '../widgets/main_page/main_page_app_bar.dart';
import '../widgets/main_page/main_page_body.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/';

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserAccountsCubit>(
      create: (context) => Get.find<UserAccountsCubit>()..load(),
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) {
            return [const MainPageAppBar()];
          },
          body: const MainPageBody(),
        ),
        floatingActionButton: const CreateAccountButton(),
      ),
    );
  }
}
