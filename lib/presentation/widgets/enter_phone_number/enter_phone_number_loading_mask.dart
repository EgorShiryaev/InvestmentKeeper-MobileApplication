import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/check_is_user_exists_cubit/check_is_user_exists_cubit.dart';
import '../../cubits/check_is_user_exists_cubit/check_is_user_exists_state.dart';
import '../loading_mask.dart';

class EnterPhoneNumberLoadingMask extends StatelessWidget {
  const EnterPhoneNumberLoadingMask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckIsUserExistsCubit, CheckIsUserExistsState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
        final isVisibility = state is LoadingCheckIsUserExistsState;
        return LoadingMask(isVisibility: isVisibility);
      },
    );
  }
}
