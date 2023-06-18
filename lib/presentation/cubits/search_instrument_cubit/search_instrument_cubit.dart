import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/exception_impl.dart';
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
      final message = error is ExceptionImpl ? error.message : error.toString();
      emit(ErrorSearchInstrumentState(message: message));
    }
  }
}
