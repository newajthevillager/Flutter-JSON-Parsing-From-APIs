import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parse_json_all/model/swapi/swapi_people_model.dart';
import 'package:parse_json_all/services/swapi_service.dart';

class SwapiPeopleListUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("People"),
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          color: Colors.grey.shade300,
          child: FutureBuilder(
            future: getSwapiPeople(),
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
                      subtitle: Text(results.gender),
                      // not putting any onTap() for now
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
      ),
    );
  }
}