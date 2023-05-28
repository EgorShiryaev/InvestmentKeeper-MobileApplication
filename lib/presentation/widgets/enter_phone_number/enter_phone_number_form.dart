import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../core/settings/phone_number_format.dart';
import '../../../core/settings/phone_number_formatter.dart';
import '../../../core/utils/validators/phone_number_validator.dart';
import '../../cubits/check_is_user_exists_cubit/check_is_user_exists_cubit.dart';
import '../../cubits/check_is_user_exists_cubit/check_is_user_exists_state.dart';
import '../space_between_form_items.dart';

class EnterPhoneNumberForm extends HookWidget {
  const EnterPhoneNumberForm({super.key});

  void clearPhoneNumberField({
    required TextEditingController controller,
  }) {
    const value = PhoneNumberFormat.code;
    controller.value = const TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }

  void submitForm(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required String phoneNumber,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      Get.find<CheckIsUserExistsCubit>().check(phoneNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.outline;
    final textStyle =
        Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor);

    final phoneNumberController =
        useTextEditingController(text: PhoneNumberFormat.code);
    final formKey = useRef(GlobalKey<FormState>()).value;

    final submit = useCallback(
      () => submitForm(
        context,
        formKey: formKey,
        phoneNumber: phoneNumberController.text,
      ),
      [phoneNumberController],
    );

    return BlocListener<CheckIsUserExistsCubit, CheckIsUserExistsState>(
      listener: (context, state) {
        if (state is ErrorCheckIsUserExistsState) {
          Get.snackbar('Произошла ошибка!', state.message);
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Чтобы войти или зарегистрироваться', style: textStyle),
            const SizedBox(height: 10),
            TextFormField(
              autofocus: true,
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              inputFormatters: [PhoneNumberFormatter()],
              validator: phoneNumberFieldValidator,
              onFieldSubmitted: (_) => submit(),
              decoration: InputDecoration(
                labelText: 'Номер телефона',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cancel_outlined),
                  onPressed: () =>
                      clearPhoneNumberField(controller: phoneNumberController),
                ),
              ),
            ),
            const SpaceBetweenFormItems(),
            FilledButton(
              onPressed: submit,
              child: const Text('Продолжить'),
            )
          ],
        ),
      ),
    );
  }
}
