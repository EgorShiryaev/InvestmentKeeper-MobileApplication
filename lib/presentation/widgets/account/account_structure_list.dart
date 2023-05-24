import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../domain/entities/account_structure.dart';
import '../../cubits/account_cubit/account_state.dart';
import 'structure_item_view.dart';

class AccountStructureList extends HookWidget {
  final AccountState state;
  const AccountStructureList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final structureState = useState(AccountStructure.empty());

    useEffect(
      () {
        if (state is LoadedAccountState) {
          structureState.value =
              (state as LoadedAccountState).account.structure;
        }
        return null;
      },
      [state],
    );

    final structure = structureState.value;
    return Column(
      children: [
        if (structure.stocks.isNotEmpty)
          StructureItemView(title: 'Акции', items: structure.stocks),
        if (structure.bonds.isNotEmpty)
          StructureItemView(title: 'Облигации', items: structure.bonds),
        if (structure.etfs.isNotEmpty)
          StructureItemView(title: 'Фонды', items: structure.etfs),
        if (structure.futures.isNotEmpty)
          StructureItemView(title: 'Фьючерсы', items: structure.futures),
      ],
    );
  }
}
