// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
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
  Future<List<PokemonModel?>> fetchAllPokemonService() {
    return _$fetchAllPokemonServiceAsyncAction
        .run(() => super.fetchAllPokemonService());
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
pokemonServiceState: ${pokemonServiceState}
    ''';
  }
}
