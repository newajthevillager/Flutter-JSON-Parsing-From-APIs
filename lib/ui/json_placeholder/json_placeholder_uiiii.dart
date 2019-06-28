import 'package:flutter/material.dart';
import 'package:parse_json_all/ui/json_placeholder/comment_ui_json_placeholder.dart';
import 'package:parse_json_all/ui/json_placeholder/post_ui_json_placeholder.dart';

class JsonPlaceholderUi extends StatefulWidget {
  @override
  _JsonPlaceholderUiState createState() => _JsonPlaceholderUiState();
}

class _JsonPlaceholderUiState extends State<JsonPlaceholderUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text("Posts"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return PostsUiJsonPlaceholder();
                }
              ));
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: Text("Comments"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CommentUiJsonPlaceholder();
                }
              ));
            },
          )
        ],
      ),
    );
  }
}
