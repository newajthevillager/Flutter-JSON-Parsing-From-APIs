import 'package:flutter/material.dart';
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
          
        ),
      ),
    );
  }
}