import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/settings/phone_number_format.dart';
import '../../../core/settings/phone_number_formatter.dart';
import '../../../core/utils/validators/phone_number_validator.dart';
import '../../cubits/check_is_user_exists_cubit/check_is_user_exists_cubit.dart';
import '../../cubits/check_is_user_exists_cubit/check_is_user_exists_state.dart';
import '../../themes/app_theme.dart';

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

    final submit = useCallback(() {
      submitForm(context, formKey: formKey, phoneNumber: controller.text);
      // ignore: require_trailing_commas
    }, [controller]);

    return BlocListener<CheckIsUserExistsCubit, CheckIsUserExistsState>(
      listener: (context, state) {
        if (state is SuccessCheckIsUserExistsState ||
            state is FailureCheckIsUserExistsState) {
          clearPhoneNumberField(controller: controller);
        }
      },
      child: SliverSafeArea(
        top: false,
        bottom: false,
        minimum: AppTheme.pagePadding,
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              Text('Чтобы войти или зарегистрироваться', style: textStyle),
              const SizedBox(height: 10),
              Form(
                key: formKey,
                child: TextFormField(
                  autofocus: true,
                  controller: controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [PhoneNumberFormatter()],
                  validator: phoneNumberFieldValidator,
                  decoration: InputDecoration(
                    labelText: 'Номер телефона',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.cancel_outlined),
                      onPressed: () {
                        clearPhoneNumberField(controller: controller);
                      },
                    ),
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
        ),
      ),
    );
  }
}
