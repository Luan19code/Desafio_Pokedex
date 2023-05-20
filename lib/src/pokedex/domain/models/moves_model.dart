import 'dart:convert';

class MovesModel {
  final String moveName;
  MovesModel({
    required this.moveName,
  });

  MovesModel copyWith({
    String? moveName,
  }) {
    return MovesModel(
      moveName: moveName ?? this.moveName,
    );
  }

  factory MovesModel.fromMap(Map<String, dynamic> map) {
    return MovesModel(
      moveName: map['move']['name'] as String,
    );
  }

  factory MovesModel.fromJson(String source) =>
      MovesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MovesModel(moveName: $moveName)';

  @override
  bool operator ==(covariant MovesModel other) {
    if (identical(this, other)) return true;

    return other.moveName == moveName;
  }

  @override
  int get hashCode => moveName.hashCode;
}
