import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/create_sale_cubit/create_sale_cubit.dart';
import '../widgets/create_sale/create_sale_app_bar.dart';
import '../widgets/create_sale/create_sale_form.dart';
import '../widgets/create_sale/create_sale_loading_mask.dart';
import '../widgets/custom_sliver_safe_area.dart';

class CreateSalePage extends StatelessWidget {
  const CreateSalePage({super.key});

  static const routeName = '/createSale';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateSaleCubit>(
      create: (context) => Get.find(),
      child: Scaffold(
        body: Stack(
          children: const [
            CustomScrollView(
              slivers: [
                CreateSaleAppBar(),
                CustomSliverSafeArea(child: CreateSaleForm()),
              ],
            ),
            CreateSaleLoadingMask()
          ],
        ),
      ),
    );
  }
}
