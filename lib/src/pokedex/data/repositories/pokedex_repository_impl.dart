import 'dart:convert';
import 'package:desafio_snapfi/src/pokedex/domain/models/pokedex_model.dart';
import 'package:desafio_snapfi/src/pokedex/domain/repositories/pokedex_repository.dart';
import 'package:http/http.dart' as http;

class PokedexRepositoryImpl implements PokedexRepository {
  @override
  Future<List<PokemonModel>> fetchPokemons({required int offset}) async {
    final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=36&offset=$offset'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> pokemonList = data['results'];

      List<PokemonModel> pokemons = [];
      for (int i = 0; i < pokemonList.length; i++) {
        final pokemonData = await http.get(Uri.parse(pokemonList[i]['url']));
        pokemons.add(PokemonModel.fromMap(jsonDecode(pokemonData.body)));
      }

      return pokemons;
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }
}
