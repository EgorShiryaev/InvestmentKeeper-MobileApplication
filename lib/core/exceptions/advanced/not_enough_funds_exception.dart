import '../exception_impl.dart';

class NotEnoughFundsException extends ExceptionImpl {
  NotEnoughFundsException() : super(message: 'Не достаточно средств на счете');
}
