import 'dart:convert';

class User {
  String username;
  String avatar;
  bool verified;

  User({
    this.username,
    this.avatar,
    this.verified,
  });

  @override
  String toString() => 'User(username: $username, avatar: $avatar)';

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'avatar': avatar,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['user'],
      avatar: map['avatar'],
      verified: map['verified'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
