class Abbreviation {
  static final Map<String, String> abbreviation = {
    "hp": "HP",
    "attack": "ATK",
    "defense": "DEF",
    "special-attack": "SATK",
    "special-defense": "SDEF",
    "speed": "SPD",
  };

  static String abbreviatedValue(String input) {
    return abbreviation[input.toLowerCase()] ?? input;
  }
}
