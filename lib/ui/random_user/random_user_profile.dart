import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parse_json_all/model/random_user_model.dart';

class RandomUserProfile extends StatefulWidget {
  final Results results;

  RandomUserProfile({this.results});

  @override
  _RandomUserProfileState createState() => _RandomUserProfileState();
}

class _RandomUserProfileState extends State<RandomUserProfile> {
  var generatedItems = List.generate(30, (index) => "Item no ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            floating: true,
            flexibleSpace: Stack(
              children: <Widget>[
                FlexibleSpaceBar(
                  title: Text(widget.results.name.first.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15.0,
                      )),
                  centerTitle: true,
                  background: Image.network(
                    widget.results.picture.large,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                buildListElement(
                  widget.results.name.title.toUpperCase() +
                  " " +
                  widget.results.name.first.toUpperCase() +
                  " " +
                  widget.results.name.last.toUpperCase()
                ),
                buildListElement("e-mail : " + widget.results.email),
                buildListElement("State : " + widget.results.location.state.toUpperCase()),
                buildListElement("Street : " + widget.results.location.street.toUpperCase()),
                buildListElement("Time Zone : " + widget.results.location.timezone.toString()),
                buildListElement("Gender : " + widget.results.gender),
                buildListElement("User Name : " + widget.results.login.username),
                buildListElement("Date of Birth : " + widget.results.dob.date),
                buildListElement("Age : " + widget.results.dob.age.toString()),
                buildListElement("Phone : " + widget.results.phone),
                buildListElement("Nationality : " + widget.results.nat)
                
              ],
            ),
          )
        ],
      ),
    );
  }

  // return a widget for SliverList
  Widget buildListElement(String text) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      color: Colors.blueGrey,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
