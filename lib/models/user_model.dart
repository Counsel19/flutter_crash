// USER MODEL

class User {
  User({required this.name, required this.email});

  final String email;
  final String name;

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "name": String name,
        "email": String email,
      } =>
        User(name: name, email: email),
      _ => throw const FormatException("Failed to create User")
    };
  }
}
