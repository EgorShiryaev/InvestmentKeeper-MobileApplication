import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/create_account_cubit/create_account_cubit.dart';
import '../../cubits/create_account_cubit/create_account_state.dart';
import '../loading_mask.dart';

class CreateAccountLoadingMask extends StatelessWidget {
  const CreateAccountLoadingMask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountCubit, CreateAccountState>(
      builder: (context, state) {
        final isVisibility = state is LoadingCreateAccountState;
        return LoadingMask(isVisibility: isVisibility);
      },
    );
  }
}
