import 'package:flutter/material.dart';
import 'package:parse_json_all/model/swapi/swapi_films_model.dart';
import 'package:parse_json_all/services/swapi_service.dart';

class SwapiFilmsListUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Films"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getSwapiFilmsList(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snap.data.results.length,
                itemBuilder: (context, index) {
                  Results results = snap.data.results[index];
                  return ListTile(
                    title: Text(results.title),
                    subtitle: Text("Director : ${results.director}"),
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