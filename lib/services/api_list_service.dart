import 'dart:convert';
import 'package:parse_json_all/model/api_list_model.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<ApiList> getApiList() async {
  var response = await rootBundle.loadString('assets/api_list.json');
  var jsonRes = json.decode(response);
  ApiList apiList = ApiList.fromJson(jsonRes);
  return apiList;
}