import 'package:desafio_snapfi/src/pokedex/domain/models/pokedex_model.dart';

abstract class PokedexRepository {
  Future<List<PokemonModel>> fetchPokemons({required int offset});

 
}
