import 'package:http/http.dart' as http;
import 'package:parse_json_all/model/comment_model.dart';
import 'dart:convert';
import 'package:parse_json_all/model/post_model.dart';

String url = "https://jsonplaceholder.typicode.com/posts";
String commentsUrl = "https://jsonplaceholder.typicode.com/posts/1/comments";

Future<PostList> getPostsFromJsonPlaceholder() async {
  var response = await http.get(url);
  var jsonRes = json.decode(response.body);
  PostList postList = PostList.fromJson(jsonRes);
  return postList;
}

Future<CommentList> getCommentsFromJsonPlaceholder() async {
  var response = await http.get(commentsUrl);
  var jsonRes = json.decode(response.body);
  CommentList commentList = CommentList.fromJson(jsonRes);
  return commentList;
}