import 'package:flutter/material.dart';
import 'package:parse_json_all/services/swapi_service.dart';
import 'package:parse_json_all/ui/swapi/swapi_people_list_ui.dart';

class SwapiEndPointsUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getSwapiEndPoints(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return ListView(
              children: <Widget>[
                ListTile(
                  title: Text("People"),
                  subtitle: Text(snap.data.people),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SwapiPeopleListUi()
                    ));
                  },
                ),
                ListTile(
                  title: Text("Planets"),
                  subtitle: Text(snap.data.planets),
                ),
                ListTile(
                  title: Text("Films"),
                  subtitle: Text(snap.data.films),
                ),
                ListTile(
                  title: Text("Species"),
                  subtitle: Text(snap.data.species),
                ),
                ListTile(
                  title: Text("Vehicles"),
                  subtitle: Text(snap.data.vehicles),
                ),
                ListTile(
                  title: Text("Starships"),
                  subtitle: Text(snap.data.starships),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}