import '../exception_impl.dart';

class UnknownException extends ExceptionImpl {
  UnknownException() : super(message: 'Неизвестная ошибка');
}
