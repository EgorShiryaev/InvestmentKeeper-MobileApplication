import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../cubits/search_instrument_cubit/search_instrument_cubit.dart';
import '../../cubits/search_instrument_cubit/search_instrument_state.dart';
import 'select_instruments_list.dart';

class SelectInstrumentForm extends HookWidget {
  const SelectInstrumentForm({super.key});

  @override
  Widget build(BuildContext context) {
    final searchText = useState('');
    final searchTextController = useTextEditingController();

    useEffect(
      () {
        final text = searchText.value;
        searchTextController.value = TextEditingValue(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
        );
        BlocProvider.of<SearchInstrumentCubit>(context).load(text);
        return null;
      },
      [searchText.value],
    );

    return Column(
      children: [
        TextField(
          autofocus: true,
          textInputAction: TextInputAction.search,
          controller: searchTextController,
          onChanged: (value) => searchText.value = value,
          decoration: InputDecoration(
            labelText: 'Поиск',
            suffixIcon: IconButton(
              icon: const Icon(Icons.cancel_outlined),
              onPressed: () => searchText.value = '',
            ),
          ),
        ),
        BlocBuilder<SearchInstrumentCubit, SearchInstrumentState>(
          builder: (context, state) {
            return SelectInstrumentsList(state: state);
          },
        ),
      ],
    );
  }
}
