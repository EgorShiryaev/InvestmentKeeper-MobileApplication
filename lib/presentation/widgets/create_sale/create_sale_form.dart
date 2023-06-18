
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
import '../../cubits/account_cubit/account_cubit.dart';
import '../../cubits/create_sale_cubit/create_sale_cubit.dart';
import '../../cubits/create_sale_cubit/create_sale_state.dart';
import '../../pages/arguments/create_sale_page_arguments.dart';
import '../checkbox_view.dart';
import '../number_field.dart';
import '../pressable_field.dart';
import '../space_between_form_items.dart';

class CreateSaleForm extends HookWidget {
  const CreateSaleForm({super.key});

  void submitForm(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required int instrumentId,
    required String lotsValue,
    required String priceValue,
    required bool withdrawFundsFromBalance,
    required DateTime dateValue,
    required TimeOfDay timeValue,
    String? commissionValue,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      final args = Get.arguments as CreateSalePageArguments;
      FocusScope.of(context).unfocus();
      final lots = int.parse(lotsValue);
      final price = getValueOfPrice(priceValue);
      final commission = getValueOfPrice(commissionValue);
      final date = DateTime(
        dateValue.year,
        dateValue.month,
        dateValue.day,
        timeValue.hour,
        timeValue.minute,
      );
      Get.find<CreateSaleCubit>().create(
        accountId: args.account.id,
        instrumentId: instrumentId,
        lots: lots,
        price: price!,
        withdrawFundsFromBalance: withdrawFundsFromBalance,
        date: date,
        commission: commission,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateState = useState(DateTime.now());
    final timeState = useState(TimeOfDay.now());
    final depositFundsToAccount = useState(true);

    final dateController = useTextEditingController();
    final timeController = useTextEditingController();
    final priceController = useTextEditingController();
    final lotsNumberController = useTextEditingController(text: '0');
    final commisionController = useTextEditingController();

    final priceFocusNode = useFocusNode();
    final lotsNumberFocusNode = useFocusNode();
    final commisionFocusNode = useFocusNode();

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
        instrumentId: 1,
        lotsValue: lotsNumberController.text,
        priceValue: priceController.text,
        withdrawFundsFromBalance: depositFundsToAccount.value,
      );
    }, [
      dateState.value,
      timeState.value,
      lotsNumberController.text,
      priceController.text,
      depositFundsToAccount.value
    ]);

    return BlocListener<CreateSaleCubit, CreateSaleState>(
      listener: (context, state) {
        if (state is SuccessCreateSaleState) {
          final args = Get.arguments as CreateSalePageArguments;
          Get.back();
          Get.find<AccountCubit>().load(args.account.id);
        } else if (state is FailureCreateSaleState) {
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
              controller: priceController,
              focusNode: priceFocusNode,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Цена продажи'),
              keyboardType: TextInputType.datetime,
              inputFormatters: [PriceFormatter()],
              validator: priceValidator,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            ),
            const SpaceBetweenFormItems(),
            NumberField(
              controller: lotsNumberController,
              focusNode: lotsNumberFocusNode,
              label: 'Количество лотов',
            ),
            const SpaceBetweenFormItems(),
            TextFormField(
              controller: commisionController,
              focusNode: commisionFocusNode,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Комиссия'),
              keyboardType: TextInputType.datetime,
              inputFormatters: [PriceFormatter()],
            ),
            const SpaceBetweenFormItems(),
            CheckBoxView(
              label: 'Зачислить средства на счет',
              value: depositFundsToAccount.value,
              onPress: (value) => depositFundsToAccount.value = value,
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
