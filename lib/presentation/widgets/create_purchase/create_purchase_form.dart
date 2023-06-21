import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../core/settings/price_formatter.dart';
import '../../../core/utils/check_commision_str.dart';
import '../../../core/utils/currency_utils/get_currency_char.dart';
import '../../../core/utils/formaters/get_value_of_price.dart';
import '../../../core/utils/formaters/remove_currency_char.dart';
import '../../../core/utils/get_money_value_text.dart';
import '../../../core/utils/validators/price_validator.dart';
import '../../../domain/entities/instrument.dart';
import '../../../domain/entities/money.dart';
import '../../cubits/account_cubit/account_cubit.dart';
import '../../cubits/create_purchase_cubit/create_purchase_cubit.dart';
import '../../cubits/create_purchase_cubit/create_purchase_state.dart';
import '../../pages/arguments/create_purchase_page_arguments.dart';
import '../checkbox_view.dart';
import '../date_time_field.dart';
import '../number_field.dart';
import '../selected_instrument_view.dart';
import '../space_between_form_items.dart';

class CreatePurchaseForm extends HookWidget {
  const CreatePurchaseForm({super.key});

  void submitForm(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required int? instrumentId,
    required String lotsValue,
    required String priceValue,
    required bool withdrawFundsFromBalance,
    required DateTime dateValue,
    required TimeOfDay timeValue,
    String? commissionValue,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      final args = Get.arguments as CreatePurchasePageArguments;
      FocusScope.of(context).unfocus();
      final lots = int.parse(lotsValue);
      final date = DateTime(
        dateValue.year,
        dateValue.month,
        dateValue.day,
        timeValue.hour,
        timeValue.minute,
      );
      final priceStr = removeCurrencyChar(priceValue);
      final commissionStr = removeCurrencyChar(commissionValue);
      final price = Money.fromString(priceStr!);
      final commission = checkCommisionStr(commissionStr)
          ? Money.fromString(commissionStr!)
          : null;
      Get.find<CreatePurchaseCubit>().create(
        accountId: args.account.id,
        instrumentId: instrumentId!,
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
    final dateState = useState(DateTime.now());
    final timeState = useState(TimeOfDay.now());
    final selectedInstrument = useState<Instrument?>(
      (Get.arguments is CreatePurchasePageArguments)
          ? (Get.arguments as CreatePurchasePageArguments).instrument
          : null,
    );
    final withdrawFundsFromBalance = useState(true);
    final priceState = useState('');
    final lotsState = useState('');
    final commissionState = useState('');

    final totalPriceState = useState('');

    final priceController = useTextEditingController();
    final lotsNumberController = useTextEditingController(text: '0');
    final commisionController = useTextEditingController();

    final priceFocusNode = useFocusNode();
    final lotsNumberFocusNode = useFocusNode();
    final commisionFocusNode = useFocusNode();

    final formKey = useRef(GlobalKey<FormState>()).value;

    final submit = useCallback(() {
      submitForm(
        context,
        formKey: formKey,
        dateValue: dateState.value,
        timeValue: timeState.value,
        instrumentId: selectedInstrument.value?.id,
        lotsValue: lotsNumberController.text,
        priceValue: priceController.text,
        withdrawFundsFromBalance: withdrawFundsFromBalance.value,
        commissionValue: commissionState.value,
      );
    }, [
      dateState.value,
      timeState.value,
      lotsNumberController.text,
      priceController.text,
      withdrawFundsFromBalance.value,
      selectedInstrument.value
    ]);

    useEffect(() {
      final price = getValueOfPrice(priceController.text);
      final lots = int.parse(lotsNumberController.text);
      final instrument = selectedInstrument.value;

      if (price != 0 && price != null && lots != 0 && instrument != null) {
        final totalLots = lots * instrument.lot;
        final comission = getValueOfPrice(commisionController.text) ?? 0;
        final newTotalPrice = price * totalLots + comission;
        final currencyChar = getCurrencyChar(instrument.currency);

        totalPriceState.value =
            newTotalPrice != 0 && withdrawFundsFromBalance.value
                ? '${getMoneyValueText(newTotalPrice)} $currencyChar'
                : '';
      }
      return null;
    }, [
      priceState.value,
      lotsState.value,
      commissionState.value,
      selectedInstrument.value,
      withdrawFundsFromBalance.value,
    ]);

    return BlocListener<CreatePurchaseCubit, CreatePurchaseState>(
      listener: (context, state) {
        if (state is SuccessCreatePurchaseState) {
          final args = Get.arguments as CreatePurchasePageArguments;
          Get.back();
          Get.find<AccountCubit>().load(args.account.id);
        } else if (state is FailureCreatePurchaseState) {
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
            SelectedInstrumentView(instrumentState: selectedInstrument),
            const SpaceBetweenFormItems(),
            TextFormField(
              autofocus: true,
              controller: priceController,
              focusNode: priceFocusNode,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Цена покупки'),
              keyboardType: TextInputType.datetime,
              inputFormatters: [PriceFormatter()],
              validator: priceValidator,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              onChanged: (value) => priceState.value = value,
            ),
            const SpaceBetweenFormItems(),
            NumberField(
              controller: lotsNumberController,
              focusNode: lotsNumberFocusNode,
              label: 'Количество лотов',
              state: lotsState,
            ),
            const SpaceBetweenFormItems(),
            TextFormField(
              controller: commisionController,
              focusNode: commisionFocusNode,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Комиссия'),
              keyboardType: TextInputType.datetime,
              inputFormatters: [PriceFormatter()],
              onChanged: (value) => commissionState.value = value,
            ),
            const SpaceBetweenFormItems(),
            CheckBoxView(
              label: 'Списать средства с счета',
              value: withdrawFundsFromBalance.value,
              onPress: (value) => withdrawFundsFromBalance.value = value,
            ),
            const SpaceBetweenFormItems(),
            FilledButton(
              onPressed: submit,
              child: Text('Создать ${totalPriceState.value}'),
            )
          ],
        ),
      ),
    );
  }
}
