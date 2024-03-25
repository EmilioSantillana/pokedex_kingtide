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
  List<PokemonModel?> pokemons = [];

  @observable
  PokemonServiceState pokemonServiceState = PokemonServiceState.normal;

  @action
  Future<List<PokemonModel?>> fetchAllPokemonService() async {
    pokemonServiceState = PokemonServiceState.loading;
    try {
      if (pokemons.isNotEmpty) return pokemons;
      final response = await pokemonService.fetchAllPokemons();
      pokemons = response;
      pokemonServiceState = PokemonServiceState.success;
      return response;
    } catch (e) {
      pokemonServiceState = PokemonServiceState.error;
      return [];
    }
  }
}
