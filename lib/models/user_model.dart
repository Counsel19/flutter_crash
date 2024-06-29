// USER MODEL

class User {
  User({required this.name, required this.email, required this.id});
  final String id;
  final String email;
  final String name;

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": String id,
        "name": String name,
        "email": String email,
      } =>
        User(id: id, name: name, email: email),
      _ => throw const FormatException("Failed to create User")
    };
  }
}
