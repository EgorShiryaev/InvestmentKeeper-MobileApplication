import '../exception_impl.dart';

class DatabaseException extends ExceptionImpl {
  DatabaseException() : super(message: 'Ошибка взаимодействия с базой данных');
}
