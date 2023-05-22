import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/settings/phone_number_format.dart';
import '../../../core/settings/phone_number_formatter.dart';
import '../../../core/utils/validators/phone_number_validator.dart';
import '../../cubits/check_is_user_exists_cubit/check_is_user_exists_cubit.dart';
import '../../cubits/check_is_user_exists_cubit/check_is_user_exists_state.dart';

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
      BlocProvider.of<CheckIsUserExistsCubit>(context).check(phoneNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.outline;
    final textStyle =
        Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor);

    final controller = useTextEditingController(text: PhoneNumberFormat.code);
    final formKey = useRef(GlobalKey<FormState>()).value;

    final submit = useCallback(
      () => submitForm(context, formKey: formKey, phoneNumber: controller.text),
      [controller],
    );

    final clearPhoneNumber = useCallback(
      () => clearPhoneNumberField(controller: controller),
      [controller],
    );

    return Form(
      key: formKey,
      child: Column(
        children: [
          BlocListener<CheckIsUserExistsCubit, CheckIsUserExistsState>(
            listener: (context, state) {
              if (state is FailureCheckIsUserExistsState) {
                clearPhoneNumberField(controller: controller);
              }
            },
          ),
          Text('Чтобы войти или зарегистрироваться', style: textStyle),
          const SizedBox(height: 10),
          TextFormField(
            autofocus: true,
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [PhoneNumberFormatter()],
            validator: phoneNumberFieldValidator,
            decoration: InputDecoration(
              labelText: 'Номер телефона',
              suffixIcon: IconButton(
                icon: const Icon(Icons.cancel_outlined),
                onPressed: clearPhoneNumber,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: submit,
            child: const Text('Продолжить'),
          )
        ],
      ),
    );
  }
}
