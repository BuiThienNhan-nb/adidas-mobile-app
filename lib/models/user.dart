import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

// class User {
//   User({
//     required this.id,
//     required this.isVerifiedEmail,
//     required this.fullname,
//     required this.dateOfBirth,
//     required this.phoneNumber,
//     required this.email,
//     required this.gender,
//   });

//   String id;
//   String fullname;
//   bool isVerifiedEmail;
//   DateTime dateOfBirth;
//   String phoneNumber;
//   String email;
//   String gender;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["_id"] ?? "",
//         fullname: json["fullname"] ?? "",
//         dateOfBirth:
//             DateTime.parse(json["dateOfBirth"] ?? DateTime.now().toString()),
//         phoneNumber:
//             (json["phoneNumber"] == null) ? "" : json["phoneNumber"] ?? "",
//         email: ((json["email"] == null) ? "" : json["email"]) ?? "",
//         gender: json["gender"] ?? "",
//         isVerifiedEmail: json["isVerifiedEmail"] ?? false,
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "fullname": fullname,
//         "dateOfBirth": dateOfBirth.toIso8601String(),
//         "phoneNumber": phoneNumber,
//         "email": email,
//         "gender": gender,
//         "isVerifiedEmail": isVerifiedEmail,
//       };
// }

class User {
  final String id;
  String fullName;
  bool isVerifiedEmail;
  DateTime dateOfBirth;
  String phoneNumber;
  final String email;
  String? gender;
  User({
    required this.id,
    required this.fullName,
    required this.isVerifiedEmail,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    this.gender,
  });

  User copyWith({
    String? id,
    String? fullName,
    bool? isVerifiedEmail,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? email,
    String? gender,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      isVerifiedEmail: isVerifiedEmail ?? this.isVerifiedEmail,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'fullName': fullName});
    result.addAll({'isVerifiedEmail': isVerifiedEmail});
    result.addAll({'dateOfBirth': dateOfBirth.millisecondsSinceEpoch});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'email': email});
    if (gender != null) {
      result.addAll({'gender': gender});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      fullName: map['fullName'] ?? '',
      isVerifiedEmail: map['isVerifiedEmail'] ?? false,
      dateOfBirth: map['dateOfBirth'] == null
          ? DateTime.now()
          : DateTime.parse(map['dateOfBirth']),
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, isVerifiedEmail: $isVerifiedEmail, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, email: $email, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.fullName == fullName &&
        other.isVerifiedEmail == isVerifiedEmail &&
        other.dateOfBirth == dateOfBirth &&
        other.phoneNumber == phoneNumber &&
        other.email == email &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        isVerifiedEmail.hashCode ^
        dateOfBirth.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode ^
        gender.hashCode;
  }
}
