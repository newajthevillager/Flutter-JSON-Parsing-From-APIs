import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:parse_json_all/model/swapi/swapi_end_points_model.dart';
import 'package:parse_json_all/model/swapi/swapi_films_model.dart';
import 'package:parse_json_all/model/swapi/swapi_people_model.dart';
import 'package:parse_json_all/model/swapi/swapi_planets_model.dart';
import 'package:parse_json_all/model/swapi/swapi_species_model.dart';

String baseUrl = "https://swapi.co/api";
String peopleUrl = "https://swapi.co/api/people";
String planetsUrl = "https://swapi.co/api/planets";
String filmsUrl = "https://swapi.co/api/films";
String speciesUrl = "https://swapi.co/api/species";

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

Future<SwapiPlanetsList> getSwapiPlanetsList() async {
  var response = await http.get(planetsUrl);
  var jsonRes = json.decode(response.body);
  SwapiPlanetsList swapiPlanetsList = SwapiPlanetsList.fromJson(jsonRes);
  return swapiPlanetsList;
}

Future<SwapiFilmsList> getSwapiFilmsList() async {
  var response = await http.get(filmsUrl);
  var jsonRes = json.decode(response.body);
  SwapiFilmsList swapiFilmsList = SwapiFilmsList.fromJson(jsonRes);
  return swapiFilmsList;
}

Future<SwapiSpeciesList> getSwapiSpecies() async {
  var response = await http.get(speciesUrl);
  var jsonRes = json.decode(response.body);
  SwapiSpeciesList swapiSpeciesList = SwapiSpeciesList.fromJson(jsonRes);
  return swapiSpeciesList;
}
