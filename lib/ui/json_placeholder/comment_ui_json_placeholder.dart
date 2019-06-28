import 'package:flutter/material.dart';
import 'package:parse_json_all/model/comment_model.dart';
import 'package:parse_json_all/services/post_service.dart';

class CommentUiJsonPlaceholder extends StatefulWidget {
  @override
  _CommentUiJsonPlaceholderState createState() => _CommentUiJsonPlaceholderState();
}

class _CommentUiJsonPlaceholderState extends State<CommentUiJsonPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: Container(
        child: FutureBuilder(
        future: getCommentsFromJsonPlaceholder(),
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return ListView.separated(
              itemCount: snap.data.comments.length,
              separatorBuilder: (ctx, index) {
                return Divider(
                  height: 10.0,
                  color: Colors.green,
                );
              },
              itemBuilder: (ctx, index) {
                
                Comment comment = snap.data.comments[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(comment.id.toString()),
                  ),
                  title: Text(comment.name),
                  subtitle: Text(comment.email),
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