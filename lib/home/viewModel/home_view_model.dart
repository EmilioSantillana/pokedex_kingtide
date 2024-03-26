import 'package:mobx/mobx.dart';

import '../model/pokemon_model.dart';
import '../../core/services/i_pokemon_service.dart';

part 'home_view_model.g.dart';

enum PokemonServiceState { loading, error, success, normal }

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  final IPokemonService pokemonService;

  HomeViewModelBase(this.pokemonService);

  @observable
  int offset = 0;

  @action
  void incrementOffset(int value) {
    offset += value;
  }

  @observable
  List<PokemonModel?> pokemons = [];

  @observable
  PokemonServiceState pokemonServiceState = PokemonServiceState.normal;

  @action
  Future<List<PokemonModel?>> fetchAllPokemonService(
      {required int limit}) async {
    if (pokemonServiceState == PokemonServiceState.loading) return pokemons;

    pokemonServiceState = PokemonServiceState.loading;
    try {
      final response = await pokemonService.fetchAllPokemons(offset: offset, limit: limit);
      pokemons.addAll(response);
      pokemonServiceState = PokemonServiceState.success;
      return response;
    } catch (e) {
      pokemonServiceState = PokemonServiceState.error;
      return [];
    }
  }
}
