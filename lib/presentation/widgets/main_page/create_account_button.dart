import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../cubits/accounts_cubit/accounts_cubit.dart';
import '../../pages/create_account_page.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  void navigateToCreateAccountPage(BuildContext context) {
    Get.toNamed(CreateAccountPage.routeName)!.then((success) {
      if (success) {
        BlocProvider.of<AccountsCubit>(context).load();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => navigateToCreateAccountPage(context),
      child: const Icon(Icons.add_rounded),
    );
  }
}
