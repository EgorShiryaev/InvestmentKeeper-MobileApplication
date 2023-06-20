class User {
  final String token;
  final String name;

  User({
    required this.token,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'] as String,
      name: json['name'] as String,
    );
  }

  @override
  String toString() {
    return name + token;
  }
}
