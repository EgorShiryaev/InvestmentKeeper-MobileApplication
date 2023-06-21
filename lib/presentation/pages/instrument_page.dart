import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/candles_cubit/candles_cubit.dart';
import '../cubits/instrument_price_cubit/instrument_price_cubit.dart';
import '../widgets/custom_sliver_safe_area.dart';
import '../widgets/instrument/instrument_app_bar.dart';
import '../widgets/instrument/instrument_page_body.dart';

class InstrumentPage extends StatelessWidget {
  const InstrumentPage({super.key});

  static const routeName = '/instrument';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<InstrumentPriceCubit>().unsubscrubeToPrice();
        return true;
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CandlesCubit>(
            create: (context) => Get.find(),
          ),
          BlocProvider<InstrumentPriceCubit>(
            create: (context) => Get.find()..subscribeToPrice(),
          )
        ],
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
      ),
    );
  }
}
