import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../core/settings/price_formatter.dart';
import '../../../core/utils/validators/price_validator.dart';
import '../../cubits/create_purchase_cubit/create_purchase_cubit.dart';
import '../../cubits/create_purchase_cubit/create_purchase_state.dart';
import '../../cubits/user_accounts_cubit/user_accounts_cubit.dart';
import '../../pages/arguments/create_purchase_page_arguments.dart';
import '../checkbox_view.dart';
import '../number_field.dart';
import '../pressable_field.dart';
import '../space_between_form_items.dart';

class CreatePurchaseForm extends HookWidget {
  const CreatePurchaseForm({super.key});

  void submitForm(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required int instrumentId,
    required int lots,
    required double price,
    required bool withdrawFundsFromBalance,
    DateTime? date,
    double? commission,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      final args = Get.arguments as CreatePurchasePageArguments;
      FocusScope.of(context).unfocus();
      Get.find<CreatePurchaseCubit>().create(
        accountId: args.account.id,
        instrumentId: instrumentId,
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
    final dateController = useTextEditingController();
    final timeController = useTextEditingController();
    final priceController = useTextEditingController();
    final lotsNumberController = useTextEditingController(text: '0');
    final commisionController = useTextEditingController();

    final priceFocusNode = useFocusNode();
    final lotsNumberFocusNode = useFocusNode();
    final commisionFocusNode = useFocusNode();

    final withdrawFundsFromBalance = useState(true);

    final formKey = useRef(GlobalKey<FormState>()).value;

    final submit = useCallback(
      () {},
      [],
    );

    return BlocListener<CreatePurchaseCubit, CreatePurchaseState>(
      listener: (context, state) {
        if (state is SuccessCreatePurchaseState) {
          Get.back();
          Get.find<UserAccountsCubit>().load();
        } else if (state is FailureCreatePurchaseState) {
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
                    onPress: () {},
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PressableTextField(
                    controller: timeController,
                    label: 'Время',
                    onPress: () {},
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
              decoration: const InputDecoration(labelText: 'Цена покупки'),
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
              validator: priceValidator,
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
              child: const Text('Создать'),
            )
          ],
        ),
      ),
    );
  }
}
