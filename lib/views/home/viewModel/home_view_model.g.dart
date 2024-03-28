// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$currentLimitAtom =
      Atom(name: 'HomeViewModelBase.currentLimit', context: context);

  @override
  int get currentLimit {
    _$currentLimitAtom.reportRead();
    return super.currentLimit;
  }

  @override
  set currentLimit(int value) {
    _$currentLimitAtom.reportWrite(value, super.currentLimit, () {
      super.currentLimit = value;
    });
  }

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

  late final _$allDataFetchedAtom =
      Atom(name: 'HomeViewModelBase.allDataFetched', context: context);

  @override
  bool get allDataFetched {
    _$allDataFetchedAtom.reportRead();
    return super.allDataFetched;
  }

  @override
  set allDataFetched(bool value) {
    _$allDataFetchedAtom.reportWrite(value, super.allDataFetched, () {
      super.allDataFetched = value;
    });
  }

  late final _$allPokemonsNameAtom =
      Atom(name: 'HomeViewModelBase.allPokemonsName', context: context);

  @override
  Set<String> get allPokemonsName {
    _$allPokemonsNameAtom.reportRead();
    return super.allPokemonsName;
  }

  @override
  set allPokemonsName(Set<String> value) {
    _$allPokemonsNameAtom.reportWrite(value, super.allPokemonsName, () {
      super.allPokemonsName = value;
    });
  }

  late final _$pokemonsAtom =
      Atom(name: 'HomeViewModelBase.pokemons', context: context);

  @override
  Set<PokemonModel?> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(Set<PokemonModel?> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$filteredPokemonsAtom =
      Atom(name: 'HomeViewModelBase.filteredPokemons', context: context);

  @override
  Set<PokemonModel?> get filteredPokemons {
    _$filteredPokemonsAtom.reportRead();
    return super.filteredPokemons;
  }

  @override
  set filteredPokemons(Set<PokemonModel?> value) {
    _$filteredPokemonsAtom.reportWrite(value, super.filteredPokemons, () {
      super.filteredPokemons = value;
    });
  }

  late final _$selectedPokemonTypesAtom =
      Atom(name: 'HomeViewModelBase.selectedPokemonTypes', context: context);

  @override
  Set<PokemonTypes> get selectedPokemonTypes {
    _$selectedPokemonTypesAtom.reportRead();
    return super.selectedPokemonTypes;
  }

  @override
  set selectedPokemonTypes(Set<PokemonTypes> value) {
    _$selectedPokemonTypesAtom.reportWrite(value, super.selectedPokemonTypes,
        () {
      super.selectedPokemonTypes = value;
    });
  }

  late final _$isFilteredAtom =
      Atom(name: 'HomeViewModelBase.isFiltered', context: context);

  @override
  bool get isFiltered {
    _$isFilteredAtom.reportRead();
    return super.isFiltered;
  }

  @override
  set isFiltered(bool value) {
    _$isFilteredAtom.reportWrite(value, super.isFiltered, () {
      super.isFiltered = value;
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
  Future<void> fetchAllPokemonService() {
    return _$fetchAllPokemonServiceAsyncAction
        .run(() => super.fetchAllPokemonService());
  }

  late final _$fetchPokemonsByNamesServiceAsyncAction = AsyncAction(
      'HomeViewModelBase.fetchPokemonsByNamesService',
      context: context);

  @override
  Future<void> fetchPokemonsByNamesService(
      {required List<String> pokemonsNames}) {
    return _$fetchPokemonsByNamesServiceAsyncAction.run(
        () => super.fetchPokemonsByNamesService(pokemonsNames: pokemonsNames));
  }

  @override
  String toString() {
    return '''
currentLimit: ${currentLimit},
offset: ${offset},
allDataFetched: ${allDataFetched},
allPokemonsName: ${allPokemonsName},
pokemons: ${pokemons},
filteredPokemons: ${filteredPokemons},
selectedPokemonTypes: ${selectedPokemonTypes},
isFiltered: ${isFiltered},
pokemonServiceState: ${pokemonServiceState}
    ''';
  }
}
