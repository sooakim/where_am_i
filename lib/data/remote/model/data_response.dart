import 'package:json_annotation/json_annotation.dart';
import 'package:where_am_i/data/remote/model/error_message_response.dart';
import 'package:where_am_i/data/remote/model/subway_arrival_response.dart';

part 'data_response.g.dart';

@JsonSerializable(nullable: false)
class DataResponse {
  final ErrorMessageResponse errorMessage;
  final List<SubwayArrivalResponse> realtimeArrivalList;

  DataResponse(
    this.errorMessage,
    this.realtimeArrivalList,
  );

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}
