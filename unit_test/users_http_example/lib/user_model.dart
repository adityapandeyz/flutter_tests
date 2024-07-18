// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String email;
  final String name;
  final String id;
  final String website;

  User({
    required this.email,
    required this.name,
    required this.id,
    required this.website,
  });

  User copyWith({
    String? email,
    String? name,
    String? id,
    String? website,
  }) {
    return User(
      email: email ?? this.email,
      name: name ?? this.name,
      id: id ?? this.id,
      website: website ?? this.website,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'id': id,
      'website': website,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      name: map['name'] as String,
      id: map['id'] as String,
      website: map['website'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(email: $email, name: $name, id: $id, website: $website)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.name == name &&
        other.id == id &&
        other.website == website;
  }

  @override
  int get hashCode {
    return email.hashCode ^ name.hashCode ^ id.hashCode ^ website.hashCode;
  }
}
