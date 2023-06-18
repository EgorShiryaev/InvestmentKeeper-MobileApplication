import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../core/settings/price_formatter.dart';
import '../../../core/utils/formaters/format_date_to_string.dart';
import '../../../core/utils/formaters/format_time_to_string.dart';
import '../../../core/utils/formaters/get_value_of_price.dart';
import '../../../core/utils/modals_utils/show_calendar.dart';
import '../../../core/utils/modals_utils/show_clock.dart';
import '../../../core/utils/validators/price_validator.dart';
import '../../../domain/entities/currency.dart';
import '../../cubits/account_cubit/account_cubit.dart';
import '../../cubits/create_refill_cubit/create_refill_cubit.dart';
import '../../cubits/create_refill_cubit/create_refill_state.dart';
import '../../pages/arguments/create_refill_page_arguments.dart';
import '../pressable_field.dart';
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
      final value = getValueOfPrice(refillValue);
      final date = DateTime(
        dateValue.year,
        dateValue.month,
        dateValue.day,
        timeValue.hour,
        timeValue.minute,
      );
      Get.find<CreateRefillCubit>().create(
        accountId: args.account.id,
        value: value!,
        currency: Currency.rub,
        date: date,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateState = useState(DateTime.now());
    final timeState = useState(TimeOfDay.now());

    final dateController = useTextEditingController();
    final timeController = useTextEditingController();
    final valueController = useTextEditingController();

    final valueFocusNode = useFocusNode();

    final formKey = useRef(GlobalKey<FormState>()).value;

    useEffect(() {
      dateController.text = formatDateToString(dateState.value);
      return null;
    }, [dateState.value]);

    useEffect(() {
      timeController.text = formatTimeToString(timeState.value);
      return null;
    }, [timeState.value]);

    final onPressDateField = useCallback(() {
      showCalendar(context, currentDate: dateState.value).then((value) {
        if (value != null) {
          dateState.value = value;
        }
      });
    }, []);

    final onPressTimeField = useCallback(() {
      showClock(context, currentTime: timeState.value).then((value) {
        if (value != null) {
          timeState.value = value;
        }
      });
    }, []);

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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: PressableTextField(
                    controller: dateController,
                    label: 'Дата',
                    onPress: onPressDateField,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PressableTextField(
                    controller: timeController,
                    label: 'Время',
                    onPress: onPressTimeField,
                  ),
                ),
              ],
            ),
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
