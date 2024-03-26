// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$offsetAtom =
      Atom(name: 'HomeViewModelBase.offset', context: context);

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  late final _$pokemonsAtom =
      Atom(name: 'HomeViewModelBase.pokemons', context: context);

  @override
  List<PokemonModel?> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<PokemonModel?> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$pokemonServiceStateAtom =
      Atom(name: 'HomeViewModelBase.pokemonServiceState', context: context);

  @override
  PokemonServiceState get pokemonServiceState {
    _$pokemonServiceStateAtom.reportRead();
    return super.pokemonServiceState;
  }

  @override
  set pokemonServiceState(PokemonServiceState value) {
    _$pokemonServiceStateAtom.reportWrite(value, super.pokemonServiceState, () {
      super.pokemonServiceState = value;
    });
  }

  late final _$fetchAllPokemonServiceAsyncAction =
      AsyncAction('HomeViewModelBase.fetchAllPokemonService', context: context);

  @override
  Future<List<PokemonModel?>> fetchAllPokemonService({required int limit}) {
    return _$fetchAllPokemonServiceAsyncAction
        .run(() => super.fetchAllPokemonService(limit: limit));
  }

  late final _$HomeViewModelBaseActionController =
      ActionController(name: 'HomeViewModelBase', context: context);

  @override
  void incrementOffset(int value) {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.incrementOffset');
    try {
      return super.incrementOffset(value);
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
offset: ${offset},
pokemons: ${pokemons},
pokemonServiceState: ${pokemonServiceState}
    ''';
  }
}
