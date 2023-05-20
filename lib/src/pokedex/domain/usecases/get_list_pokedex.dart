import 'package:desafio_snapfi/src/pokedex/domain/models/pokedex_model.dart';
import 'package:desafio_snapfi/src/pokedex/domain/repositories/pokedex_repository.dart';
import 'package:get_it/get_it.dart';

class GetListPokedexUseCase {
  Future<List<PokemonModel>> call({required int offset}) async {
    return await GetIt.I.get<PokedexRepository>().fetchPokemons(offset: offset);
  }
}
