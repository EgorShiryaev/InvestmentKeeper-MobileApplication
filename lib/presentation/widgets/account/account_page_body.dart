import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../cubits/account_cubit/account_cubit.dart';
import '../../cubits/account_cubit/account_state.dart';
import '../custom_sliver_safe_area.dart';
import 'account_structure_list.dart';

class AccountPageBody extends HookWidget {
  const AccountPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final refreshIndicatorKey =
        useRef(GlobalKey<RefreshIndicatorState>()).value;

    return BlocListener<AccountCubit, AccountState>(
      listener: (context, state) {
        if (state is LoadingAccountState) {
          refreshIndicatorKey.currentState?.show();
        }
      },
      child: RefreshIndicator(
        key: refreshIndicatorKey,
        onRefresh: Get.find<AccountCubit>().refresh,
        child: CustomScrollView(
          slivers: [
            CustomSliverSafeArea(
              child: BlocBuilder<AccountCubit, AccountState>(
                builder: (context, state) {
                  return AccountStructureList(state: state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
