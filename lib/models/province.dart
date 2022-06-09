import 'dart:convert';

class Province {
  final String idProvince;
  final String name;
  Province({
    required this.idProvince,
    required this.name,
  });

  Province copyWith({
    String? idProvince,
    String? name,
  }) {
    return Province(
      idProvince: idProvince ?? this.idProvince,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'idProvince': idProvince});
    result.addAll({'name': name});

    return result;
  }

  factory Province.fromMap(Map<String, dynamic> map) {
    return Province(
      idProvince: map['idProvince'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Province.fromJson(String source) =>
      Province.fromMap(json.decode(source));

  @override
  String toString() => 'Province(idProvince: $idProvince, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Province &&
        other.idProvince == idProvince &&
        other.name == name;
  }

  @override
  int get hashCode => idProvince.hashCode ^ name.hashCode;
}
