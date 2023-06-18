import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/search_instrument_cubit/search_instrument_cubit.dart';
import '../widgets/custom_sliver_safe_area.dart';
import '../widgets/select_instrument/select_instrument_app_bar.dart';
import '../widgets/select_instrument/select_instrument_form.dart';

class SelectInstrumentPage extends StatelessWidget {
  const SelectInstrumentPage({super.key});

  static const routeName = '/selectInstrument';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchInstrumentCubit>(
      create: (context) => Get.find(),
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            SelectInstrumentAppBar(),
            CustomSliverSafeArea(child: SelectInstrumentForm()),
          ],
        ),
      ),
    );
  }
}
