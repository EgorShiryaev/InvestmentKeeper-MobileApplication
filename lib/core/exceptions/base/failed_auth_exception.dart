import '../exception_impl.dart';

class FailedAuthException extends ExceptionImpl {
  FailedAuthException() : super(message: 'Не удалось авторизоваться');
}
