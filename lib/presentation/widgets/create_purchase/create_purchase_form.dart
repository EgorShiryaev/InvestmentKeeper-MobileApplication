import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../cubits/create_purchase_cubit/create_purchase_cubit.dart';
import '../../cubits/create_purchase_cubit/create_purchase_state.dart';
import '../../cubits/user_accounts_cubit/user_accounts_cubit.dart';
import '../../pages/arguments/create_purchase_page_arguments.dart';
import '../space_between_form_items.dart';

class CreatePurchaseForm extends HookWidget {
  const CreatePurchaseForm({super.key});

  void submitForm(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required int instrumentId,
    required int lots,
    required double price,
    required bool withdrawFundsFromBalance,
    DateTime? date,
    double? commission,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      final args = Get.arguments as CreatePurchasePageArguments;
      FocusScope.of(context).unfocus();
      Get.find<CreatePurchaseCubit>().create(
        accountId: args.account.id,
        instrumentId: instrumentId,
        lots: lots,
        price: price,
        withdrawFundsFromBalance: withdrawFundsFromBalance,
        date: date,
        commission: commission,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final dateController = useTextEditingController(text: '123');
    final timeController = useTextEditingController();

    final formKey = useRef(GlobalKey<FormState>()).value;

    final submit = useCallback(
      () {},
      [],
    );

    return BlocListener<CreatePurchaseCubit, CreatePurchaseState>(
      listener: (context, state) {
        if (state is SuccessCreatePurchaseState) {
          Get.back();
          Get.find<UserAccountsCubit>().load();
        } else if (state is FailureCreatePurchaseState) {
          Get.snackbar('Произошла ошибка!', state.message);
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: InkWell(
                    customBorder: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    onTap: () {
                      log('tap');
                    },
                    child: Container(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: timeController,
                    decoration: const InputDecoration(labelText: 'Время'),
                  ),
                ),
              ],
            ),
            const SpaceBetweenFormItems(),
            FilledButton(
              onPressed: submit,
              child: const Text('Создать'),
            )
          ],
        ),
      ),
    );
  }
}
