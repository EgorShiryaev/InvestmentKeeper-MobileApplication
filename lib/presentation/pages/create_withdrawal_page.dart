import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/create_withdrawal_cubit/create_withdrawal_cubit.dart';
import '../widgets/create_withdrawal/create_withdrawal_app_bar.dart';
import '../widgets/create_withdrawal/create_withdrawal_form.dart';
import '../widgets/create_withdrawal/create_withdrawal_loading_mask.dart';
import '../widgets/custom_sliver_safe_area.dart';

class CreateWithdrawalPage extends StatelessWidget {
  const CreateWithdrawalPage({super.key});

  static const routeName = '/createWithdrawal';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateWithdrawalCubit>(
      create: (context) => Get.find(),
      child: Scaffold(
        body: Stack(
          children: const [
            CustomScrollView(
              slivers: [
                CreateWithdrawalAppBar(),
                CustomSliverSafeArea(child: CreateWithdrawalForm()),
              ],
            ),
            CreateWithdrawalLoadingMask()
          ],
        ),
      ),
    );
  }
}
