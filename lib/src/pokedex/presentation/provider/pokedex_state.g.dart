// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokedexState on _PokedexStateBase, Store {
  late final _$pokemonListAtom =
      Atom(name: '_PokedexStateBase.pokemonList', context: context);

  @override
  ObservableList<PokemonModel> get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(ObservableList<PokemonModel> value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  late final _$isLoadedListAtom =
      Atom(name: '_PokedexStateBase.isLoadedList', context: context);

  @override
  bool get isLoadedList {
    _$isLoadedListAtom.reportRead();
    return super.isLoadedList;
  }

  @override
  set isLoadedList(bool value) {
    _$isLoadedListAtom.reportWrite(value, super.isLoadedList, () {
      super.isLoadedList = value;
    });
  }

  late final _$pokemonSelectedAtom =
      Atom(name: '_PokedexStateBase.pokemonSelected', context: context);

  @override
  PokemonModel? get pokemonSelected {
    _$pokemonSelectedAtom.reportRead();
    return super.pokemonSelected;
  }

  @override
  set pokemonSelected(PokemonModel? value) {
    _$pokemonSelectedAtom.reportWrite(value, super.pokemonSelected, () {
      super.pokemonSelected = value;
    });
  }

  late final _$endOfTheListAtom =
      Atom(name: '_PokedexStateBase.endOfTheList', context: context);

  @override
  bool get endOfTheList {
    _$endOfTheListAtom.reportRead();
    return super.endOfTheList;
  }

  @override
  set endOfTheList(bool value) {
    _$endOfTheListAtom.reportWrite(value, super.endOfTheList, () {
      super.endOfTheList = value;
    });
  }

  late final _$getPokedexListAsyncAction =
      AsyncAction('_PokedexStateBase.getPokedexList', context: context);

  @override
  Future<dynamic> getPokedexList() {
    return _$getPokedexListAsyncAction.run(() => super.getPokedexList());
  }

  late final _$_PokedexStateBaseActionController =
      ActionController(name: '_PokedexStateBase', context: context);

  @override
  void setEndOfTheList(bool value) {
    final _$actionInfo = _$_PokedexStateBaseActionController.startAction(
        name: '_PokedexStateBase.setEndOfTheList');
    try {
      return super.setEndOfTheList(value);
    } finally {
      _$_PokedexStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPokemonSelected(PokemonModel pokemon) {
    final _$actionInfo = _$_PokedexStateBaseActionController.startAction(
        name: '_PokedexStateBase.setPokemonSelected');
    try {
      return super.setPokemonSelected(pokemon);
    } finally {
      _$_PokedexStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextPokemon() {
    final _$actionInfo = _$_PokedexStateBaseActionController.startAction(
        name: '_PokedexStateBase.nextPokemon');
    try {
      return super.nextPokemon();
    } finally {
      _$_PokedexStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousPokemon() {
    final _$actionInfo = _$_PokedexStateBaseActionController.startAction(
        name: '_PokedexStateBase.previousPokemon');
    try {
      return super.previousPokemon();
    } finally {
      _$_PokedexStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonList: ${pokemonList},
isLoadedList: ${isLoadedList},
pokemonSelected: ${pokemonSelected},
endOfTheList: ${endOfTheList}
    ''';
  }
}
