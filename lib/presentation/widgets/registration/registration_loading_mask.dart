import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../cubits/registration_cubit/registration_cubit.dart';
import '../../cubits/registration_cubit/registration_state.dart';
import '../loading_mask.dart';

class RegistrationLoadingMask extends HookWidget {
  const RegistrationLoadingMask({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        final isVisibility = state is LoadingRegistrationState;
        return LoadingMask(isVisibility: isVisibility);
      },
    );
  }
}
