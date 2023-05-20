import 'dart:convert';

class StatsModel {
  final int baseStat;
  final String nameStat;
  StatsModel({
    required this.baseStat,
    required this.nameStat,
  });

  StatsModel copyWith({
    int? baseStat,
    String? nameStat,
  }) {
    return StatsModel(
      baseStat: baseStat ?? this.baseStat,
      nameStat: nameStat ?? this.nameStat,
    );
  }

  factory StatsModel.fromMap(Map<String, dynamic> map) {
    return StatsModel(
      baseStat: map['base_stat'] as int,
      nameStat: map['stat']['name'] as String,
    );
  }

  factory StatsModel.fromJson(String source) =>
      StatsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StatsModel(baseStat: $baseStat, nameStat: $nameStat)';

  @override
  bool operator ==(covariant StatsModel other) {
    if (identical(this, other)) return true;

    return other.baseStat == baseStat && other.nameStat == nameStat;
  }

  @override
  int get hashCode => baseStat.hashCode ^ nameStat.hashCode;
}
