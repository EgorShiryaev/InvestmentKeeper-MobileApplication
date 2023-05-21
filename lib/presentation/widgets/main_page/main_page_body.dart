import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../cubits/accounts_cubit/accounts_cubit.dart';
import '../../cubits/accounts_cubit/accounts_state.dart';
import '../custom_sliver_safe_area.dart';
import 'accounts_list.dart';

class MainPageBody extends HookWidget {
  const MainPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final refreshIndicatorKey =
        useRef(GlobalKey<RefreshIndicatorState>()).value;

    final state = Get.find<AccountsCubit>().state;
    useEffect(() {
      if (state is LoadingAccountsState) {
        refreshIndicatorKey.currentState?.show();
      }
    }, [state]);

    return RefreshIndicator(
      key: refreshIndicatorKey,
      onRefresh: Get.find<AccountsCubit>().load,
      child: const CustomScrollView(
        slivers: [
          CustomSliverSafeArea(
            child: AccountsList(),
          )
        ],
      ),
    );
  }
}
