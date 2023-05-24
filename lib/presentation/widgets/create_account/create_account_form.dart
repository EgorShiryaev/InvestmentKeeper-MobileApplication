import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../core/utils/validators/empty_value_validar.dart';
import '../../cubits/create_account_cubit/create_account_cubit.dart';
import '../../cubits/create_account_cubit/create_account_state.dart';

class CreateAccountForm extends HookWidget {
  const CreateAccountForm({super.key});

  void submitForm(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required String title,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      Get.find<CreateAccountCubit>().create(title);
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final formKey = useRef(GlobalKey<FormState>()).value;

    final submit = useCallback(
      () => submitForm(context, formKey: formKey, title: titleController.text),
      [titleController],
    );

    return BlocListener<CreateAccountCubit, CreateAccountState>(
      listener: (context, state) {
        if (state is SuccessCreateAccountState) {
          Get.back(result: true);
        } else if (state is FailureCreateAccountState) {
          Get.snackbar('Произошла ошибка!', state.message);
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              autofocus: true,
              controller: titleController,
              keyboardType: TextInputType.name,
              validator: emptyValueValidator,
              decoration: InputDecoration(
                labelText: 'Название',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cancel_outlined),
                  onPressed: () => titleController.text = '',
                ),
              ),
            ),
            const SizedBox(height: 20),
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
