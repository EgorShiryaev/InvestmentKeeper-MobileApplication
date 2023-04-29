import 'exception_impl.dart';

class ServerNotAvailableException extends ExceptionImpl {
  ServerNotAvailableException()
      : super(message: 'Сервер не доступен. Проверьте подключение к сети');
}
