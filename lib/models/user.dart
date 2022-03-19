import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.fullname,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.gender,
  });

  String id;
  String fullname;
  DateTime dateOfBirth;
  String phoneNumber;
  String email;
  String gender;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        fullname: json["fullname"],
        dateOfBirth:
            DateTime.parse(json["dateOfBirth"] ?? DateTime.now().toString()),
        phoneNumber:
            (json["phoneNumber"] == null) ? "" : json["phoneNumber"] ?? "",
        email: ((json["email"] == null) ? "" : json["email"]) ?? "",
        gender: json["gender"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "phoneNumber": phoneNumber,
        "email": email,
        "gender": gender,
      };
}
