import 'package:dio/dio.dart';

import '../../domain/entities/error_id.dart';
import '../../domain/entities/error_response.dart';
import '../exceptions/advanced/not_enough_funds_exception.dart';
import '../exceptions/advanced/not_enough_lots_exception.dart';
import '../exceptions/advanced/unknown_exception.dart';
import '../exceptions/advanced/user_is_already_exists_exception.dart';
import '../exceptions/base/database_exception.dart';
import '../exceptions/base/failed_auth_exception.dart';
import '../exceptions/base/forbidden_exception.dart';
import '../exceptions/base/server_error_exception.dart';
import '../exceptions/base/server_not_available_exception.dart';
import '../exceptions/exception_impl.dart';
import '../exceptions/not_found/account_not_found_exception.dart';
import '../exceptions/not_found/currency_not_found_exception.dart';
import '../exceptions/not_found/instrument_not_found_exception.dart';
import '../exceptions/not_found/user_not_found_exception.dart';

ExceptionImpl getExceptionFromDioError(DioError error) {
  if (error.response == null) {
    return ServerNotAvailableException();
  }
  final ErrorResponse errorResponse =
      ErrorResponse.fromJson(error.response?.data);

  switch (errorResponse.id) {
    case ExceptionId.accountNotFound:
      return AccountNotFoundException();
    case ExceptionId.currencyNotFound:
      return CurrencyNotFoundException();
    case ExceptionId.database:
      return DatabaseException();
    case ExceptionId.failedAuth:
      return FailedAuthException();
    case ExceptionId.forbidden:
      return ForbiddenException();
    case ExceptionId.investInstrumentNotFound:
      return InstrumentNotFoundException();
    case ExceptionId.notEnoughFunds:
      return NotEnoughFundsException();
    case ExceptionId.notEnoughLots:
      return NotEnoughLotsException();
    case ExceptionId.serverError:
      return ServerErrorException();
    case ExceptionId.unknown:
      return UnknownException();
    case ExceptionId.userIsAlreadyExists:
      return UserIsAlreadyExistsException();
    case ExceptionId.userNotFound:
      return UserNotFoundException();
  }
}
