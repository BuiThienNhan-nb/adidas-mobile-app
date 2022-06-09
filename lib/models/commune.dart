import 'dart:convert';

class Commune {
  final String idDistrict;
  final String idCommune;
  final String name;
  Commune({
    required this.idDistrict,
    required this.idCommune,
    required this.name,
  });

  Commune copyWith({
    String? idDistrict,
    String? idCommune,
    String? name,
  }) {
    return Commune(
      idDistrict: idDistrict ?? this.idDistrict,
      idCommune: idCommune ?? this.idCommune,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'idDistrict': idDistrict});
    result.addAll({'idCommune': idCommune});
    result.addAll({'name': name});

    return result;
  }

  factory Commune.fromMap(Map<String, dynamic> map) {
    return Commune(
      idDistrict: map['idDistrict'] ?? '',
      idCommune: map['idCommune'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Commune.fromJson(String source) =>
      Commune.fromMap(json.decode(source));

  @override
  String toString() =>
      'Commune(idDistrict: $idDistrict, idCommune: $idCommune, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Commune &&
        other.idDistrict == idDistrict &&
        other.idCommune == idCommune &&
        other.name == name;
  }

  @override
  int get hashCode => idDistrict.hashCode ^ idCommune.hashCode ^ name.hashCode;
}
