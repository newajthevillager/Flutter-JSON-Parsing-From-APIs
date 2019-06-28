import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:parse_json_all/model/random_user_model.dart';

String url = "https://randomuser.me/api/?results=10";

Future<RandomUsers> getRandomUsers() async {
  var response = await http.get(url);
  var strRes = json.decode(response.body);
  RandomUsers randomUsers = RandomUsers.fromJson(strRes);
  return randomUsers;
}