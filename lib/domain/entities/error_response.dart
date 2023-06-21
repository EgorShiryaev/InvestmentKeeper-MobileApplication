import 'error_id.dart';

class ErrorResponse {
  final ExceptionId id;
  final String message;

  ErrorResponse({
    required this.id,
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    final id = instrumentTypesMap[json['id']];
    return ErrorResponse(
      id: id!,
      message: json['message'],
    );
  }
}
