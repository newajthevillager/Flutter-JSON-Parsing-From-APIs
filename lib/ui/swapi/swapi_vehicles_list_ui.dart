import 'package:flutter/material.dart';
import 'package:parse_json_all/model/swapi/swapi_vehicles_model.dart';
import 'package:parse_json_all/services/swapi_service.dart';

class SwapiVehiclesListUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicles"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getSwapiVehicles(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snap.data.results.length,
                itemBuilder: (context, index) {
                  Results results = snap.data.results[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(results.name[0]),
                    ),
                    title: Text(results.name),
                    subtitle: Text("Manufacturer : ${results.manufacturer}"),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}