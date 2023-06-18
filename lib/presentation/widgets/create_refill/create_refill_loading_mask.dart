import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/create_refill_cubit/create_refill_cubit.dart';
import '../../cubits/create_refill_cubit/create_refill_state.dart';
import '../loading_mask.dart';

class CreateRefillLoadingMask extends StatelessWidget {
  const CreateRefillLoadingMask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRefillCubit, CreateRefillState>(
      builder: (context, state) {
        final isVisibility = state is LoadingCreateRefillState;
        return LoadingMask(isVisibility: isVisibility);
      },
    );
  }
}
