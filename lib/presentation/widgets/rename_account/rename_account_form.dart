import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../core/utils/validators/empty_value_validar.dart';
import '../../cubits/account_cubit/account_cubit.dart';
import '../../cubits/edit_account_cubit/edit_account_cubit.dart';
import '../../cubits/edit_account_cubit/edit_account_state.dart';
import '../../cubits/registration_cubit/registration_state.dart';
import '../../pages/arguments/rename_account_page_arguments.dart';

class RenameAccountForm extends HookWidget {
  const RenameAccountForm({super.key});

  void submitForm(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required String title,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      final args = Get.arguments as RenameAccountPageArguments;
      FocusScope.of(context).unfocus();
      Get.find<EditAccountCubit>().rename(title: title, id: args.account.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();

    final titleFocusNode = useFocusNode();

    final formKey = useRef(GlobalKey<FormState>()).value;

    final submit = useCallback(() {
      submitForm(context, formKey: formKey, title: titleController.text);
      // ignore: require_trailing_commas
    }, [titleController]);

    return BlocListener<EditAccountCubit, EditAccountState>(
      listener: (context, state) {
        if (state is SuccessEditAccountState) {
          final args = Get.arguments as RenameAccountPageArguments;
          Get
            ..back()
            ..back();
          Get.find<AccountCubit>().load(args.account.id);
        } else if (state is FailureEditAccountState) {
          Get.snackbar('Произошла ошибка!', state.message);
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: titleController,
              focusNode: titleFocusNode,
              textInputAction: TextInputAction.next,
              validator: emptyValueValidator,
              onFieldSubmitted: (_) => submit(),
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
              child: const Text('Продолжить'),
            ),
          ],
        ),
      ),
    );
  }
}
