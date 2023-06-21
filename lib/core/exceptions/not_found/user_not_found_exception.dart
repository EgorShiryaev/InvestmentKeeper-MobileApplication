import '../exception_impl.dart';

class UserNotFoundException extends ExceptionImpl {
  UserNotFoundException() : super(message: 'Пользователь не найден');
}
