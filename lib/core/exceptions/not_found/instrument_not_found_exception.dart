import '../exception_impl.dart';

class InstrumentNotFoundException extends ExceptionImpl {
  InstrumentNotFoundException()
      : super(message: 'Инвестиционный Инструмент не найден');
}
