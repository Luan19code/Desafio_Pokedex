import 'package:flutter/material.dart';

class CustomColors {
  static const Color primary = Color(0xFFDC0A2D);
  static const Color accent = Color(0xFF1366B4);
  static const Color primaryText = Color(0xFF212121);
  static const Color secondaryText = Color(0xFF757575);
  static const Color divider = Color(0xFFBDBDBD);
  static const Color background = Color(0xFFF3FFFF);
  static const Color error = Color(0xFFB00020);
  static const Color danger = Color(0xFFB00020);
  static const Color success = Color(0xFF00C853);
  static const Color warning = Color(0xFFFFAB00);
  static const Color info = Color(0xFF2196F3);
  static const Color transparent = Color(0x00000000);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF666666);
  static const Color greyLight = Color(0xFFE0E0E0);
  static const Color green = Color(0xFF74CB48);
  static const Color greenLight = Color(0xFFE3F5DA);

  static final Map<String, Color> pokemonTypeColors = {
    "normal": Colors.brown[400]!,
    "fighting": Colors.red[600]!,
    "flying": Colors.indigo[200]!,
    "poison": Colors.purple,
    "ground": Colors.orange[300]!,
    "rock": Colors.grey,
    "bug": Colors.lime[500]!,
    "ghost": Colors.indigo[700]!,
    "steel": Colors.blueGrey,
    "fire": Colors.red,
    "water": Colors.blue,
    "grass": Colors.green,
    "electric": Colors.yellow,
    "psychic": Colors.pink,
    "ice": Colors.cyanAccent[400]!,
    "dragon": Colors.indigo[800]!,
    "dark": Colors.brown,
    "fairy": Colors.pinkAccent[100]!,
  };

  static Color getPokemonColor(String type) {
    return pokemonTypeColors[type] ?? Colors.brown[400]!;
  }
}
