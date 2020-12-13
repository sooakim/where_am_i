import 'package:json_annotation/json_annotation.dart';

part 'error_message_response.g.dart';

@JsonSerializable(nullable: false)
class ErrorMessageResponse {
  final int status;
  final String code;
  final String message;
  final String link;
  final String developerMessage;
  final int total;

  ErrorMessageResponse(
    this.status,
    this.code,
    this.message,
    this.link,
    this.developerMessage,
    this.total,
  );

  factory ErrorMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorMessageResponseToJson(this);
}
