import 'dart:convert';

class SpritesModel {
  final String? frontDefault;

  SpritesModel({
    this.frontDefault,
  });

  SpritesModel copyWith({
    String? frontDefault,
  }) {
    return SpritesModel(
      frontDefault: frontDefault ?? this.frontDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'front_default': frontDefault,
    };
  }

  factory SpritesModel.fromMap(Map<String, dynamic> map) {
    return SpritesModel(
      frontDefault:
          map['other']['official-artwork']['front_default'] != null ? map['other']['official-artwork']['front_default'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpritesModel.fromJson(String source) =>
      SpritesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SpritesModel(frontDefault: $frontDefault)';

  @override
  bool operator ==(covariant SpritesModel other) {
    if (identical(this, other)) return true;

    return other.frontDefault == frontDefault;
  }

  @override
  int get hashCode => frontDefault.hashCode;
}
