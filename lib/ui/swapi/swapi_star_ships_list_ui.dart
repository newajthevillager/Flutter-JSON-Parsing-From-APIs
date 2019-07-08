import 'package:flutter/material.dart';
import 'package:parse_json_all/model/swapi/swapi_startships_model.dart';
import 'package:parse_json_all/services/swapi_service.dart';

class SwapiStarShipsListUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Starships"),
      ),
      body: FutureBuilder(
        future: getStartShips(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snap.data.results.length,
              itemBuilder: (context, index) {
                Results results = snap.data.results[index];
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text(results.name),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}