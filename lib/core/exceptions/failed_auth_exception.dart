import 'exception_impl.dart';

class FailedAuthException extends ExceptionImpl {
  FailedAuthException() : super(message: 'Неудачная попытка авторизации');
}
