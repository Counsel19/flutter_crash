// Post_model.dart

class Post {
  Post({
    required this.title,
    required this.body,
    required this.userId,
    required this.id,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory Post.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "userId": int userId,
        "id": int id,
        "title": String title,
        "body": String body
      } =>
        Post(body: body, userId: userId, id: id, title: title),
      _ => throw const FormatException("Failed to create Post")
    };
  }
}
