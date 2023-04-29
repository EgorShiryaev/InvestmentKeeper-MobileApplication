import 'exception_impl.dart';

class ServerErrorException extends ExceptionImpl {
  ServerErrorException() : super(message: 'Ошибка сервера');
}
