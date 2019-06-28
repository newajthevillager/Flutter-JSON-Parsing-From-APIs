class CommentList {
  final List<Comment> comments;

  CommentList({this.comments});

  factory CommentList.fromJson(List<dynamic> json) {
    List<Comment> list;
    list = json.map((f) => Comment.fromJson(f)).toList();
    return CommentList(comments: list);
  }
}

class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment({this.postId, this.id, this.name, this.email, this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}
