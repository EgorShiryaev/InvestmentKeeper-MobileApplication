import 'exception_impl.dart';

class UserIsAlreadyExistsException extends ExceptionImpl {
  UserIsAlreadyExistsException()
      : super(
          message: 'Пользователь с такими данными уже существует',
        );
}
