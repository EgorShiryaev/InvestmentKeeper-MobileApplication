import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/create_withdrawal_cubit/create_withdrawal_cubit.dart';
import '../../cubits/create_withdrawal_cubit/create_withdrawal_state.dart';
import '../loading_mask.dart';

class CreateWithdrawalLoadingMask extends StatelessWidget {
  const CreateWithdrawalLoadingMask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWithdrawalCubit, CreateWithdrawalState>(
      builder: (context, state) {
        final isVisibility = state is LoadingCreateWithdrawalState;
        return LoadingMask(isVisibility: isVisibility);
      },
    );
  }
}
