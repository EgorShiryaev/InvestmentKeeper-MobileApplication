import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../cubits/user_accounts_cubit/user_accounts_cubit.dart';
import '../../cubits/user_accounts_cubit/user_accounts_state.dart';
import '../custom_sliver_safe_area.dart';
import 'accounts_list.dart';

class MainPageBody extends HookWidget {
  const MainPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final refreshIndicatorKey =
        useRef(GlobalKey<RefreshIndicatorState>()).value;

    return BlocListener<UserAccountsCubit, UserAccountsState>(
      listener: (context, state) {
        if (state is LoadingUserAccountsState) {
          refreshIndicatorKey.currentState?.show();
        } else if (state is ErrorUserAccountsState) {
          Get.snackbar('Произошла ошибка!', state.message);
        }
      },
      child: RefreshIndicator(
        key: refreshIndicatorKey,
        onRefresh: Get.find<UserAccountsCubit>().load,
        child: CustomScrollView(
          slivers: [
            CustomSliverSafeArea(
              child: BlocBuilder<UserAccountsCubit, UserAccountsState>(
                builder: (context, state) {
                  return AccountsList(state: state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
