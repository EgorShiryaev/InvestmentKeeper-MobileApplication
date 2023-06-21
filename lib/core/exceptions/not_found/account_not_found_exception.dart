import '../exception_impl.dart';

class AccountNotFoundException extends ExceptionImpl {
  AccountNotFoundException() : super(message: 'Брокерский счет не найден');
}
