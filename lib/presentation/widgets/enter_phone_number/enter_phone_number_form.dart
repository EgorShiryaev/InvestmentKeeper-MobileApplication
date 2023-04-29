import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/settings/phone_number_format.dart';
import '../../../core/settings/phone_number_formatter.dart';
import '../../cubits/check_is_user_exists_cubit/check_is_user_exists_cubit.dart';
import '../../themes/app_theme.dart';

class EnterPhoneNumberForm extends HookWidget {
  const EnterPhoneNumberForm({super.key});

  String? phoneNumberFieldValidator(String? value) {
    if (value?.length != PhoneNumberFormat.mask.length) {
      return 'Заполните поле';
    }
    return null;
  }

  void clearPhoneNumberField(TextEditingController controller) {
    const value = PhoneNumberFormat.code;
    controller.value = const TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }

  void submit(
    BuildContext context,
    GlobalKey<FormState> key,
    TextEditingController controller,
  ) {
    if (key.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      BlocProvider.of<CheckIsUserExistsCubit>(context)
          .check(controller.text)
          .then((_) => clearPhoneNumberField(controller));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.outline;
    final textStyle =
        Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor);

    final controller = useTextEditingController(text: PhoneNumberFormat.code);
    final key = useRef(GlobalKey<FormState>()).value;

    return SliverSafeArea(
      top: false,
      bottom: false,
      minimum: AppTheme.pagePadding,
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Text('Чтобы войти или зарегистрироваться', style: textStyle),
            const SizedBox(height: 10),
            Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    maxLength: PhoneNumberFormat.mask.length,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [PhoneNumberFormatter()],
                    validator: phoneNumberFieldValidator,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.cancel_outlined),
                        onPressed: () => clearPhoneNumberField(controller),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => submit(context, key, controller),
              child: const Text('Продолжить'),
            )
          ],
        ),
      ),
    );
  }
}
