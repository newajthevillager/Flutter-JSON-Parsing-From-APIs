import 'package:flutter/material.dart';
import 'package:parse_json_all/model/swapi/swapi_species_model.dart';
import 'package:parse_json_all/services/swapi_service.dart';

class SwapiSpeciesListUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Species"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getSwapiSpecies(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snap.data.results.length,
                itemBuilder: (context, index) {
                  Results results = snap.data.results[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        results.name[0]
                      ),
                    ),
                    title: Text(results.name),
                    subtitle: Text("Classification : ${results.classification}"),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}