// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) {
  return DataResponse(
    ErrorMessageResponse.fromJson(json['errorMessage'] as Map<String, dynamic>),
    (json['realtimeArrivalList'] as List)
        .map((e) => SubwayArrivalResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'realtimeArrivalList': instance.realtimeArrivalList,
    };
