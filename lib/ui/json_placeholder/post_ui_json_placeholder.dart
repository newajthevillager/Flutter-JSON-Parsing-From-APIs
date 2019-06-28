import 'package:flutter/material.dart';
import 'package:parse_json_all/model/post_model.dart';
import 'package:parse_json_all/services/post_service.dart';

class PostsUiJsonPlaceholder extends StatefulWidget {
  @override
  _PostsUiJsonPlaceholderState createState() => _PostsUiJsonPlaceholderState();
}

class _PostsUiJsonPlaceholderState extends State<PostsUiJsonPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: getPostsFromJsonPlaceholder(),
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return ListView.separated(
              itemCount: snap.data.posts.length,
              separatorBuilder: (ctx, index) {
                return Divider(
                  height: 10.0,
                  color: Colors.green,
                );
              },
              itemBuilder: (ctx, index) {
                Post post = snap.data.posts[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(post.id.toString()),
                  ),
                  title: Text(post.title),
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
    );
  }
}
