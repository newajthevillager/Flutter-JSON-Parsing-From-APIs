import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:parse_json_all/model/swapi/swapi_end_points_model.dart';
import 'package:parse_json_all/model/swapi/swapi_people_model.dart';

String baseUrl = "https://swapi.co/api";
String peopleUrl = "";

Future<SwapiEndPoints> getSwapiEndPoints() async {
  var response = await http.get(baseUrl);
  var jsonRes = json.decode(response.body);
  SwapiEndPoints swapiEndPoints = SwapiEndPoints.fromJson(jsonRes);
  return swapiEndPoints;
}

Future<SwapiPeopleList> getSwapiPeople() async {
  var response = await http.get(peopleUrl);
  var jsonRes = json.decode(response.body);
  SwapiPeopleList swapiPeopleList = SwapiPeopleList.fromJson(jsonRes);
  return swapiPeopleList;
}