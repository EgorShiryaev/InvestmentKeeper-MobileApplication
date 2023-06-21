import '../exception_impl.dart';

class NotEnoughLotsException extends ExceptionImpl {
  NotEnoughLotsException() : super(message: 'Не достаточно лотов на счете');
}
