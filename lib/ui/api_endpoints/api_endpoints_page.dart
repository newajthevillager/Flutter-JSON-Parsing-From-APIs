import 'package:flutter/material.dart';
import 'package:parse_json_all/ui/city_bike/city_bike_ui.dart';
import 'package:parse_json_all/ui/json_placeholder/json_placeholder_uiiii.dart';
import 'package:parse_json_all/ui/pokemon/pokemon_ui.dart';
import 'package:parse_json_all/ui/random_user/random_user_ui.dart';
import 'package:parse_json_all/ui/swapi/swapi_end_points_ui.dart';

class ApiEndpointsPage extends StatefulWidget {
  final String appBarTitle;

  ApiEndpointsPage({this.appBarTitle});

  @override
  _ApiEndpointsPageState createState() => _ApiEndpointsPageState();
}

class _ApiEndpointsPageState extends State<ApiEndpointsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: buildBody(widget.appBarTitle),
    );
  }

  Widget buildBody(String title) {
    switch (title) {
      case "JSON placeholder":
        return JsonPlaceholderUi();
      case "Random User":
        return RandomUserUi();
      case "City Bike":
        return CityBikeUi();
      case "Pokemon":
        return PokemonUi();
      case "Swapi":
        return SwapiEndPointsUi();
    }
  }
}
