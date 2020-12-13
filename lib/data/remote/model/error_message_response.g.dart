// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorMessageResponse _$ErrorMessageResponseFromJson(Map<String, dynamic> json) {
  return ErrorMessageResponse(
    json['status'] as int,
    json['code'] as String,
    json['message'] as String,
    json['link'] as String,
    json['developerMessage'] as String,
    json['total'] as int,
  );
}

Map<String, dynamic> _$ErrorMessageResponseToJson(
        ErrorMessageResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'link': instance.link,
      'developerMessage': instance.developerMessage,
      'total': instance.total,
    };
