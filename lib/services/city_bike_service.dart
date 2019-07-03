import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:parse_json_all/model/city_bike_model.dart';

String bikeListUrl = "http://api.citybik.es/v2/networks";

Future<CityBikeNetworkList> getCityBikeNetworksList() async {
  var response = await http.get(bikeListUrl);
  var strRes = json.decode(response.body);
  CityBikeNetworkList cityBikeNetworkList= CityBikeNetworkList.fromJson(strRes);
  return cityBikeNetworkList;
}