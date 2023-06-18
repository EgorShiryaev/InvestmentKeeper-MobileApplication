import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/create_sale_cubit/create_sale_cubit.dart';
import '../../cubits/create_sale_cubit/create_sale_state.dart';
import '../loading_mask.dart';

class CreateSaleLoadingMask extends StatelessWidget {
  const CreateSaleLoadingMask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateSaleCubit, CreateSaleState>(
      builder: (context, state) {
        final isVisibility = state is LoadingCreateSaleState;
        return LoadingMask(isVisibility: isVisibility);
      },
    );
  }
}
