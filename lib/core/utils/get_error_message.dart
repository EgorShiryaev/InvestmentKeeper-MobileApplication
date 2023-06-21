import '../exceptions/exception_impl.dart';

String getErrorMessage(Object error) {
  return error is ExceptionImpl ? error.message : error.toString();
}
