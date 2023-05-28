import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/create_purchase_cubit/create_purchase_cubit.dart';
import '../widgets/create_purchase/create_purchase_app_bar.dart';
import '../widgets/create_purchase/create_purchase_form.dart';
import '../widgets/create_purchase/create_purchase_loading_mask.dart';
import '../widgets/custom_sliver_safe_area.dart';

class CreatePurchasePage extends StatelessWidget {
  const CreatePurchasePage({super.key});

  static const routeName = '/createPurchase';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreatePurchaseCubit>(
      create: (context) => Get.find(),
      child: Scaffold(
        body: Stack(
          children: const [
            CustomScrollView(
              slivers: [
                CreatePurchaseAppBar(),
                CustomSliverSafeArea(child: CreatePurchaseForm()),
              ],
            ),
            CreatePurchaseLoadingMask()
          ],
        ),
      ),
    );
  }
}
