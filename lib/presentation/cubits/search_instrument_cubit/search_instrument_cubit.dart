import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/get_error_message.dart';
import '../../../data/datasources/instruments_datasource/instruments_datasource.dart';
import 'search_instrument_state.dart';

class SearchInstrumentCubit extends Cubit<SearchInstrumentState> {
  final InstrumentsDatasource _datasource;

  SearchInstrumentCubit({required InstrumentsDatasource datasource})
      : _datasource = datasource,
        super(InitialSearchInstrumentState());

  Future<void> load(String query) async {
    try {
      if (query.trim().isEmpty) {
        emit(EmptySearchInstrumentState());
        return;
      }
      emit(LoadingSearchInstrumentState());
      final instruments = await _datasource.search(query);
      emit(LoadedSearchInstrumentState(instruments: instruments));
    } catch (error) {
      final message = getErrorMessage(error);
      emit(ErrorSearchInstrumentState(message: message));
    }
  }
}
