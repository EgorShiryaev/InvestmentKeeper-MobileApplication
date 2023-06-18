import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../domain/entities/instrument.dart';
import '../pages/select_instrument_page.dart';
import 'pressable_field.dart';

class SelectedInstrumentView extends HookWidget {
  final ValueNotifier<Instrument?> instrumentState;
  const SelectedInstrumentView({
    super.key,
    required this.instrumentState,
  });

  void navigateToSelectInstrumentPage() {
    Get.toNamed(SelectInstrumentPage.routeName)!.then((value) {
      if (value != null) {
        instrumentState.value = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PressableTextField(
      controller: TextEditingController(
        text: instrumentState.value?.title ?? '',
      ),
      onPress: navigateToSelectInstrumentPage,
      label: 'Инвестиционный инструмент',
    );
  }
}
