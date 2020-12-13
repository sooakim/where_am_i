import 'package:json_annotation/json_annotation.dart';

part 'subway_arrival_response.g.dart';

@JsonSerializable(nullable: true)
class SubwayArrivalResponse {
  final String subwayId;
  final String updnLine;
  final String trainLineNm;
  final String subwayHeading;
  final String statnFid;
  final String statnTid;
  final String statnId;
  final String statnNm;
  final String trainCo;
  final String ordkey;
  final String subwayList;
  final String statnList;
  final String btrainSttus;
  final String barvlDt;
  final String btrainNo;
  final String bstatnId;
  final String bstatnNm;
  final String recptnDt;
  final String arvlMsg2;
  final String arvlMsg3;
  final String arvlCd;

  SubwayArrivalResponse(
    this.subwayId,
    this.updnLine,
    this.trainLineNm,
    this.subwayHeading,
    this.statnFid,
    this.statnTid,
    this.statnId,
    this.statnNm,
    this.trainCo,
    this.ordkey,
    this.subwayList,
    this.statnList,
    this.btrainSttus,
    this.barvlDt,
    this.btrainNo,
    this.bstatnId,
    this.bstatnNm,
    this.recptnDt,
    this.arvlMsg2,
    this.arvlMsg3,
    this.arvlCd,
  );

  factory SubwayArrivalResponse.fromJson(Map<String, dynamic> json) =>
      _$SubwayArrivalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubwayArrivalResponseToJson(this);
}
