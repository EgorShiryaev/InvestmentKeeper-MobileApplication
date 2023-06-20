import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../core/settings/price_formatter.dart';
import '../../../core/utils/formaters/remove_currency_char.dart';
import '../../../core/utils/validators/price_validator.dart';
import '../../../domain/entities/currency.dart';
import '../../../domain/entities/money.dart';
import '../../cubits/account_cubit/account_cubit.dart';
import '../../cubits/create_refill_cubit/create_refill_cubit.dart';
import '../../cubits/create_refill_cubit/create_refill_state.dart';
import '../../pages/arguments/create_refill_page_arguments.dart';
import '../date_time_field.dart';
import '../space_between_form_items.dart';

class CreateRefillForm extends HookWidget {
  const CreateRefillForm({super.key});

  void submitForm(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required String refillValue,
    required DateTime dateValue,
    required TimeOfDay timeValue,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      final args = Get.arguments as CreateRefillPageArguments;
      FocusScope.of(context).unfocus();
      final date = DateTime(
        dateValue.year,
        dateValue.month,
        dateValue.day,
        timeValue.hour,
        timeValue.minute,
      );
      final valueWithoutCurrency = removeCurrencyChar(refillValue);
      final value = Money.fromString(valueWithoutCurrency!);
      Get.find<CreateRefillCubit>().create(
        accountId: args.account.id,
        value: value,
        currency: Currency.rub,
        date: date,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateState = useState(DateTime.now());
    final timeState = useState(TimeOfDay.now());

    final valueController = useTextEditingController();

    final valueFocusNode = useFocusNode();

    final formKey = useRef(GlobalKey<FormState>()).value;

    final submit = useCallback(() {
      submitForm(
        context,
        formKey: formKey,
        dateValue: dateState.value,
        timeValue: timeState.value,
        refillValue: valueController.text,
      );
    }, [
      dateState.value,
      timeState.value,
      valueController.text,
    ]);

    return BlocListener<CreateRefillCubit, CreateRefillState>(
      listener: (context, state) {
        if (state is SuccessCreateRefillState) {
          final args = Get.arguments as CreateRefillPageArguments;
          Get.back();
          Get.find<AccountCubit>().load(args.account.id);
        } else if (state is FailureCreateRefillState) {
          Get.snackbar('Произошла ошибка!', state.message);
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DateTimeField(dateState: dateState, timeState: timeState),
            const SpaceBetweenFormItems(),
            TextFormField(
              autofocus: true,
              controller: valueController,
              focusNode: valueFocusNode,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Сумма пополнения'),
              keyboardType: TextInputType.datetime,
              inputFormatters: [PriceFormatter()],
              validator: priceValidator,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
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
