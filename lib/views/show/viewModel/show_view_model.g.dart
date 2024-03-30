// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShowViewModel on ShowViewModelBase, Store {
  late final _$pokemonServiceStateAtom =
      Atom(name: 'ShowViewModelBase.pokemonServiceState', context: context);

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

  late final _$fetchPokemonServiceAsyncAction =
      AsyncAction('ShowViewModelBase.fetchPokemonService', context: context);

  @override
  Future<void> fetchPokemonService() {
    return _$fetchPokemonServiceAsyncAction
        .run(() => super.fetchPokemonService());
  }

  @override
  String toString() {
    return '''
pokemonServiceState: ${pokemonServiceState}
    ''';
  }
}
