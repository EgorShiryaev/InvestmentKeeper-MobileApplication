import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/create_refill_cubit/create_refill_cubit.dart';
import '../widgets/create_refill/create_refill_app_bar.dart';
import '../widgets/create_refill/create_refill_form.dart';
import '../widgets/create_refill/create_refill_loading_mask.dart';
import '../widgets/custom_sliver_safe_area.dart';

class CreateRefillPage extends StatelessWidget {
  const CreateRefillPage({super.key});

  static const routeName = '/createRefill';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateRefillCubit>(
      create: (context) => Get.find(),
      child: Scaffold(
        body: Stack(
          children: const [
            CustomScrollView(
              slivers: [
                CreateRefillAppBar(),
                CustomSliverSafeArea(child: CreateRefillForm()),
              ],
            ),
            CreateRefillLoadingMask()
          ],
        ),
      ),
    );
  }
}
