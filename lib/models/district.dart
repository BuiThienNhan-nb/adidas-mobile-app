import 'dart:convert';

class District {
  final String idProvince;
  final String idDistrict;
  final String name;
  District({
    required this.idProvince,
    required this.idDistrict,
    required this.name,
  });

  District copyWith({
    String? idProvince,
    String? idDistrict,
    String? name,
  }) {
    return District(
      idProvince: idProvince ?? this.idProvince,
      idDistrict: idDistrict ?? this.idDistrict,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'idProvince': idProvince});
    result.addAll({'idDistrict': idDistrict});
    result.addAll({'name': name});

    return result;
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      idProvince: map['idProvince'] ?? '',
      idDistrict: map['idDistrict'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) =>
      District.fromMap(json.decode(source));

  @override
  String toString() =>
      'District(idProvince: $idProvince, idDistrict: $idDistrict, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is District &&
        other.idProvince == idProvince &&
        other.idDistrict == idDistrict &&
        other.name == name;
  }

  @override
  int get hashCode => idProvince.hashCode ^ idDistrict.hashCode ^ name.hashCode;
}
