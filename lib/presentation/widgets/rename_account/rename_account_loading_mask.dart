import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/edit_account_cubit/edit_account_cubit.dart';
import '../../cubits/edit_account_cubit/edit_account_state.dart';

import '../loading_mask.dart';

class EditAccountLoadingMask extends StatelessWidget {
  const EditAccountLoadingMask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAccountCubit, EditAccountState>(
      builder: (context, state) {
        final isVisibility = state is LoadingEditAccountState;
        return LoadingMask(isVisibility: isVisibility);
      },
    );
  }
}
