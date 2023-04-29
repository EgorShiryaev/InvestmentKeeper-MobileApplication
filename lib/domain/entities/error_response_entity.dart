// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'error_response_entity.g.dart';

@JsonSerializable()
class ErrorResponse {
  final String message;

  ErrorResponse({required this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
