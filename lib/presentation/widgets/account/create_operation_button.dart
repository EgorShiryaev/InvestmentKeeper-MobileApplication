import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../cubits/account_cubit/account_cubit.dart';
import '../../pages/create_account_page.dart';

class CreateOperationButton extends StatelessWidget {
  const CreateOperationButton({super.key});

  void navigateToCreateOperationPage(BuildContext context) {
    Get.toNamed(CreateAccountPage.routeName)!.then((success) {
      if (success) {
        BlocProvider.of<AccountCubit>(context).load();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => navigateToCreateOperationPage(context),
      child: const Icon(Icons.add_rounded),
    );
  }
}
