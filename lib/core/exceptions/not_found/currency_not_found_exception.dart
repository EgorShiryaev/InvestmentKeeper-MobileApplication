import '../exception_impl.dart';

class CurrencyNotFoundException extends ExceptionImpl {
  CurrencyNotFoundException() : super(message: 'Валюта не найдена');
}
