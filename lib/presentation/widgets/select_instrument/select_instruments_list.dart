import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../../../domain/entities/instrument.dart';
import '../../cubits/search_instrument_cubit/search_instrument_state.dart';

class SelectInstrumentsList extends HookWidget {
  final SearchInstrumentState state;
  const SelectInstrumentsList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final instrumentsState = useState(<Instrument>[]);

    useEffect(
      () {
        if (state is LoadedSearchInstrumentState) {
          instrumentsState.value =
              (state as LoadedSearchInstrumentState).instruments;
        } else if (state is EmptySearchInstrumentState) {
          instrumentsState.value = [];
        }
        return null;
      },
      [state],
    );

    final textStyle = Theme.of(context).textTheme.titleMedium;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(4)),
      ),
      child: Builder(
        builder: (context) {
          if (state is LoadingSearchInstrumentState) {
            return const SizedBox(
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.none,
                child: CircularProgressIndicator(),
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(instrumentsState.value.length, (index) {
              final item = instrumentsState.value[index];
              return InkWell(
                onTap: () => Get.back(result: item),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      item.title,
                      style: textStyle,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
