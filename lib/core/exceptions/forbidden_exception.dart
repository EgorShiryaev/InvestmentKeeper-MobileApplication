import 'exception_impl.dart';

class ForbiddenException extends ExceptionImpl {
  ForbiddenException()
      : super(
          message: 'Запрос не авторизован. Требуется повторная авторизация',
        );
}
