import 'dart:convert';

class TypesModel {
  final String? nameType;
  TypesModel({
    this.nameType,
  });

  TypesModel copyWith({
    String? nameType,
  }) {
    return TypesModel(
      nameType: nameType ?? this.nameType,
    );
  }

  factory TypesModel.fromMap(Map<String, dynamic> map) {
    return TypesModel(
      nameType:
          map['type']['name'] != null ? map['type']['name'] as String : null,
    );
  }

  factory TypesModel.fromJson(String source) =>
      TypesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TypesModel(nameType: $nameType)';

  @override
  bool operator ==(covariant TypesModel other) {
    if (identical(this, other)) return true;

    return other.nameType == nameType;
  }

  @override
  int get hashCode => nameType.hashCode;
}
