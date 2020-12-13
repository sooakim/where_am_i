import 'dart:convert';
import 'dart:io';

import 'package:where_am_i/data/remote/model/data_response.dart';

import 'package:where_am_i/constant.dart';
import 'package:http/http.dart' as http;

Future<DataResponse> getArrivals(
  int page,
  int limit,
  String stationName,
) async {
  final url =
      "http://swopenapi.seoul.go.kr/api/subway/${DATA_API_KEY}/json/realtimeStationArrival/${page}/${limit}/${stationName}";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return DataResponse.fromJson(jsonDecode(response.body));
  } else {
    throw new HttpException(response.body);
  }
}
