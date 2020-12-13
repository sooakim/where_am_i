import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:where_am_i/data/model/subway_arrival_entity.dart';
import 'package:where_am_i/data/remote/api/subway_arrival_api.dart'
    as SubwayArrivalApi;

class SubwayArrivalRepository {
  static const int _PAGE_LIMIT = 5;

  String _stationName = null;

  List<SubwayArrivalEntity> _subwayArrivals = [];
  final BehaviorSubject<List<SubwayArrivalEntity>> _subwayArrivalsSubject =
      new BehaviorSubject.seeded([]);

  String _errorMesssage = null;
  final PublishSubject _errorMessageSubject = new PublishSubject();

  get subwayArrivals => _subwayArrivalsSubject.stream;

  get errorMessage => _errorMessageSubject.stream;

  void search(String stationName) {
    this._stationName = stationName;
    this._loadInitial();
  }

  void _loadInitial() async {
    if (this._stationName == null) {
      throw new ErrorDescription("stationName required!");
    }
    final response =
        await SubwayArrivalApi.getArrivals(0, _PAGE_LIMIT, this._stationName);
    if (response.errorMessage.status == 200) {
      print(response);
      _subwayArrivals = response.realtimeArrivalList
          .map((arrival) => SubwayArrivalEntity.fromRemote(arrival))
          .toList();
      _subwayArrivalsSubject.sink.add(_subwayArrivals);
    } else {
      this._errorMesssage = response.errorMessage.message;
      _errorMessageSubject.sink.add(_errorMesssage);
    }
  }

  void loadMore() async {
    if (this._stationName == null) {
      throw new ErrorDescription("stationName required!");
    }
    final response = await SubwayArrivalApi.getArrivals(
        this._subwayArrivals.length, _PAGE_LIMIT, this._stationName);
    if (response.errorMessage.status == 200) {
      _subwayArrivals.addAll(response.realtimeArrivalList
          .map((arrival) => SubwayArrivalEntity.fromRemote(arrival))
          .toList());
      _subwayArrivalsSubject.sink.add(_subwayArrivals);
    } else {
      this._errorMesssage = response.errorMessage.message;
      _errorMessageSubject.sink.add(_errorMesssage);
    }
  }
}

final subwayArrivalRepository = new SubwayArrivalRepository();
