/// Model representing a post.
class PostModel {
  int? postId; // The ID of the post
  int? id; // The ID of the post's author
  String? name; // The name of the post's author
  String? email; // The email of the post's author
  String? body; // The body text of the post

  /// Constructor for creating a PostModel instance.
  PostModel({this.postId, this.id, this.name, this.email, this.body});

  /// Constructor for creating a PostModel instance from JSON data.
  PostModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  /// Method for converting the PostModel instance to a JSON object.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }
}
