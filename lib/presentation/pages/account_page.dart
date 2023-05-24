import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/account_cubit/account_cubit.dart';
import '../widgets/account/account_app_bar.dart';
import '../widgets/account/account_page_body.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  static const routeName = '/account';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (context) => Get.find()..load(),
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) {
            return [const AccountAppBar()];
          },
          body: const AccountPageBody(),
        ),
      ),
    );
  }
}
