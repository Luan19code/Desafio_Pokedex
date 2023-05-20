import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:desafio_snapfi/src/pokedex/domain/models/moves_model.dart';
import 'package:desafio_snapfi/src/pokedex/domain/models/sprites_model.dart';
import 'package:desafio_snapfi/src/pokedex/domain/models/stats_model.dart';
import 'package:desafio_snapfi/src/pokedex/domain/models/types_model.dart';

class PokemonModel {
  final int? id;
  final int? height;
  final int? weight;
  final String? name;
  final SpritesModel? sprite;
  final List<StatsModel>? stats;
  final List<TypesModel>? types;
  final List<MovesModel>? moves;
  
  PokemonModel({
    this.id,
    this.height,
    this.weight,
    this.name,
    this.sprite,
    this.stats,
    this.types,
    this.moves,
  });

  get getId {
    return "#${(id).toString().padLeft(3, '0')}";
  }

  get getWeight {
    return weight! / 10;
  }

  get getHeight {
    return height! / 10;
  }

  get capitalizeFirstLetter {
    if (name != null && name!.isEmpty) return name;

    return name![0].toUpperCase() + name!.substring(1);
  }

  PokemonModel copyWith({
    int? id,
    int? height,
    int? weight,
    String? name,
    SpritesModel? sprite,
    List<StatsModel>? stats,
    List<TypesModel>? types,
    List<MovesModel>? moves,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      name: name ?? this.name,
      sprite: sprite ?? this.sprite,
      stats: stats ?? this.stats,
      types: types ?? this.types,
      moves: moves ?? this.moves,
    );
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'] != null ? map['id'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
      weight: map['weight'] != null ? map['weight'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      sprite: map['sprites'] != null
          ? SpritesModel.fromMap(map['sprites'] as Map<String, dynamic>)
          : null,
      stats: map['stats'] != null
          ? List<StatsModel>.from(
              (map['stats'] as List<dynamic>).map<StatsModel?>(
                (x) => StatsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      types: map['types'] != null
          ? List<TypesModel>.from(
              (map['types'] as List<dynamic>).map<TypesModel?>(
                (x) => TypesModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      moves: map['moves'] != null
          ? List<MovesModel>.from(
              (map['moves'] as List<dynamic>).map<MovesModel?>(
                (x) => MovesModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PokemonModel(id: $id, height: $height, weight: $weight, name: $name, sprites: $sprite, stats: $stats, types: $types, moves: $moves)';
  }

  @override
  bool operator ==(covariant PokemonModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.height == height &&
        other.weight == weight &&
        other.name == name &&
        other.sprite == sprite &&
        listEquals(other.stats, stats) &&
        listEquals(other.types, types) &&
        listEquals(other.moves, moves);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        name.hashCode ^
        sprite.hashCode ^
        stats.hashCode ^
        types.hashCode ^
        moves.hashCode;
  }
}
