import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/create_purchase_cubit/create_purchase_cubit.dart';
import '../../cubits/create_purchase_cubit/create_purchase_state.dart';
import '../loading_mask.dart';

class CreatePurchaseLoadingMask extends StatelessWidget {
  const CreatePurchaseLoadingMask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePurchaseCubit, CreatePurchaseState>(
      builder: (context, state) {
        final isVisibility = state is LoadingCreatePurchaseState;
        return LoadingMask(isVisibility: isVisibility);
      },
    );
  }
}
