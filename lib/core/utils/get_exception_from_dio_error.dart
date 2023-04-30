import 'package:dio/dio.dart';

import '../../domain/entities/error_response.dart';
import '../enums/status_code.dart';
import '../exceptions/bad_request_exception.dart';
import '../exceptions/exception_impl.dart';
import '../exceptions/failed_auth_exception.dart';
import '../exceptions/forbidden_exception.dart';
import '../exceptions/not_found_exception.dart';
import '../exceptions/server_error_exception.dart';
import '../exceptions/server_not_available_exception.dart';
import '../exceptions/unknown_exception.dart';

ExceptionImpl getExceptionFromDioError(DioError error) {
  if (error.response == null) {
    return ServerNotAvailableException();
  }
  final ErrorResponse errorResponse =
      ErrorResponse.fromJson(error.response?.data);
  switch (error.response?.statusCode) {
    case StatusCode.badRequest:
      return BadRequestException(message: errorResponse.message);
    case StatusCode.failedAuth:
      return FailedAuthException();
    case StatusCode.forbidden:
      return ForbiddenException();
    case StatusCode.notFound:
      return NotFoundException(message: errorResponse.message);
    case StatusCode.serverError:
      return ServerErrorException();
  }

  return UnknownException();
}
