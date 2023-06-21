import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/candles_cubit/candles_cubit.dart';
import '../widgets/custom_sliver_safe_area.dart';
import '../widgets/instrument/instrument_app_bar.dart';
import '../widgets/instrument/instrument_page_body.dart';

class InstrumentPage extends StatelessWidget {
  const InstrumentPage({super.key});

  static const routeName = '/instrument';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CandlesCubit>(
      create: (context) => Get.find(),
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            InstumentAppBar(),
            CustomSliverSafeArea(
              needPagePaddingHorizontal: false,
              child: InstrumentPageBody(),
            ),
          ],
        ),
      ),
    );
  }
}