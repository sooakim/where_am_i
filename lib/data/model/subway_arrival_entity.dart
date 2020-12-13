import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/data/remote/model/subway_arrival_response.dart';

class SubwayArrivalEntity {
  final int subwayId;
  final SubwayDirectionType directionType;
  final String direction;
  final SubwayDoorDirection doorDirection;
  final int prevStationId;
  final int nextStationId;
  final String stationName;
  final int numberOfTransitLine;
  final List<int> relatedSubwayIds;
  final List<int> relatedStationIds;
  final SubwayType subwayType;
  final int arrivalAtSeconds;
  final int trainNumber;
  final int finalStationId;
  final String finalStationName;
  final DateTime createdAt;
  final String arrivalMessage1;
  final String arrivalMessage2;
  final SubwayArrivalStatus arrivalStatus;

  SubwayArrivalEntity(
    this.subwayId,
    this.directionType,
    this.direction,
    this.doorDirection,
    this.prevStationId,
    this.nextStationId,
    this.stationName,
    this.numberOfTransitLine,
    this.relatedSubwayIds,
    this.relatedStationIds,
    this.subwayType,
    this.arrivalAtSeconds,
    this.trainNumber,
    this.finalStationId,
    this.finalStationName,
    this.createdAt,
    this.arrivalMessage1,
    this.arrivalMessage2,
    this.arrivalStatus,
  );

  factory SubwayArrivalEntity.fromRemote(SubwayArrivalResponse response) {
    return SubwayArrivalEntity(
      int.tryParse(response.subwayId ?? ''),
      _subwayDirectionTypeFromString(response.updnLine),
      response.trainLineNm,
      _subwayDoorDirectionFromString(response.subwayHeading),
      int.tryParse(response.statnFid ?? ''),
      int.tryParse(response.statnTid ?? ''),
      response.statnNm,
      int.tryParse(response.trainCo ?? ''),
      response.subwayList
          .split(",")
          .map((subwayId) => int.tryParse(subwayId ?? ''))
          .toList(),
      response.statnList
          .split(",")
          .map((stationId) => int.tryParse(stationId ?? ''))
          .toList(),
      _subwayTypeFromString(response.btrainSttus),
      int.tryParse(response.barvlDt ?? ''),
      int.tryParse(response.btrainNo ?? ''),
      int.tryParse(response.bstatnId ?? ''),
      response.bstatnNm,
      DateFormat("yyyy-MM-dd HH:mm:dd.s").parse(response.recptnDt, false),
      response.arvlMsg2,
      response.arvlMsg3,
      _subwayArrivalStatusFromString(response.arvlCd),
    );
  }
}

enum SubwayDirectionType {
  OuterCircle,
  InnerCircle,
  UpBound,
  DownBound,
}

SubwayDirectionType _subwayDirectionTypeFromString(String updnLine) {
  if (updnLine == null) {
    return null;
  }
  switch (updnLine) {
    case "내선":
      return SubwayDirectionType.InnerCircle;
    case "외선":
      return SubwayDirectionType.OuterCircle;
    case "상행":
      return SubwayDirectionType.UpBound;
    case "하행":
      return SubwayDirectionType.DownBound;
    default:
      throw ErrorDescription("not matched direction!");
  }
}

enum SubwayDoorDirection {
  LEFT,
  RIGHT,
}

SubwayDoorDirection _subwayDoorDirectionFromString(String subwayHeading) {
  if (subwayHeading == null) {
    return null;
  }
  switch (subwayHeading) {
    case "왼쪽":
      return SubwayDoorDirection.LEFT;
    case "오른쪽":
      return SubwayDoorDirection.RIGHT;
    default:
      throw ErrorDescription("not matched door direction!");
  }
}

enum SubwayType {
  EXPRESS,
  ITX,
}

SubwayType _subwayTypeFromString(String btrainSttus) {
  if (btrainSttus == null) {
    return null;
  }
  switch (btrainSttus) {
    case "급행":
      return SubwayType.EXPRESS;
    case "ITX":
      return SubwayType.ITX;
    default:
      throw ErrorDescription("not matched subway type!");
  }
}

enum SubwayArrivalStatus {
  ENTERED,
  ARRIVAL,
  DEPARTED,
  PREV_DEPARTED,
  PREV_ENTERED,
  PREV_ARRIVAL,
  ON_GOING,
}

SubwayArrivalStatus _subwayArrivalStatusFromString(String arvlCd) {
  if (arvlCd == null) {
    return null;
  }
  switch (arvlCd) {
    case "0":
      return SubwayArrivalStatus.ENTERED;
    case "1":
      return SubwayArrivalStatus.ARRIVAL;
    case "2":
      return SubwayArrivalStatus.DEPARTED;
    case "3":
      return SubwayArrivalStatus.PREV_DEPARTED;
    case "4":
      return SubwayArrivalStatus.PREV_ENTERED;
    case "5":
      return SubwayArrivalStatus.PREV_ARRIVAL;
    case "99":
      return SubwayArrivalStatus.ON_GOING;
    default:
      throw ErrorDescription("not matched subway arrival status!");
  }
}
