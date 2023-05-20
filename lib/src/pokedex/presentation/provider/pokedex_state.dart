import 'package:desafio_snapfi/core/utils/get_it_menager.dart';
import 'package:desafio_snapfi/core/utils/snack_bar_service.dart';
import 'package:desafio_snapfi/src/pokedex/domain/models/pokedex_model.dart';
import 'package:desafio_snapfi/src/pokedex/domain/usecases/get_list_pokedex.dart';
import 'package:mobx/mobx.dart';
part 'pokedex_state.g.dart';

class PokedexState = _PokedexStateBase with _$PokedexState;

abstract class _PokedexStateBase with Store {
  @observable
  ObservableList<PokemonModel> pokemonList = ObservableList.of([]);

  @observable
  bool isLoadedList = false;

  int offset = 0;
  bool maxList = false;

  @observable
  PokemonModel? pokemonSelected;

  @observable
  bool endOfTheList = false;

  @action
  void setEndOfTheList(bool value) => endOfTheList = value;

  @action
  void setPokemonSelected(PokemonModel pokemon) => pokemonSelected = pokemon;

  @action
  void nextPokemon() {
    if (elementLast()) return;
    final index = pokemonList.indexOf(pokemonSelected);
    pokemonSelected = pokemonList[index + 1];
  }

  @action
  void previousPokemon() {
    if (elementFirst()) return;
    final index = pokemonList.indexOf(pokemonSelected);
    pokemonSelected = pokemonList[index - 1];
  }

  void halfOfTheList() {
    final index = pokemonList.indexOf(pokemonSelected) + 1;
    final half = pokemonList.length / 2;
    if (index >= half) {
      getPokedexList();
    }
  }

  bool elementFirst() => pokemonList.first == pokemonSelected;
  bool elementLast() => pokemonList.last == pokemonSelected;

  @action
  Future getPokedexList() async {
    if (isLoadedList || maxList) return;
    isLoadedList = true;
    try {
      final result = await locator.get<GetListPokedexUseCase>()(
          offset: pokemonList.length);
      pokemonList.addAll(result.asObservable());
      if (result.isEmpty) {
        maxList = true;
      }
    } catch (e, s) {
      locator<SnackbarService>()
          .showSnackbar('Erro ao carregar lista de pokemons');
    }
    isLoadedList = false;
  }
}
