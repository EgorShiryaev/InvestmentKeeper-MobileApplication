import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../core/utils/modals_utils/show_custom_bottom_sheet.dart';
import '../cubits/account_cubit/account_cubit.dart';
import '../widgets/account/account_app_bar.dart';
import '../widgets/account/account_page_body.dart';
import '../widgets/account/create_operations_bottom_sheet.dart';
import 'arguments/account_page_arguments.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  static const routeName = '/account';

  void showCreateOperationsBottomSheet(BuildContext context) {
    final args = Get.arguments as AccountPageArguments;
    showCustomBottomSheet(
      context,
      bottomSheet: CreateOperationsBottomSheet(account: args.account),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (context) => Get.find()
        ..subscribeToPrice()
        ..refresh(),
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) {
            return [const AccountAppBar()];
          },
          body: const AccountPageBody(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showCreateOperationsBottomSheet(context),
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
