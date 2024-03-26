import 'package:mobx/mobx.dart';

import '../../../core/utils/primitive_wrapper.dart';
import '../model/pokemon_model.dart';
import '../../../core/services/i_pokemon_service.dart';

part 'home_view_model.g.dart';

enum PokemonServiceState { loading, error, success, normal }

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  final IPokemonService pokemonService;

  HomeViewModelBase(this.pokemonService);

  @observable
  PrimitiveWrapper<bool> allDataFetched = PrimitiveWrapper<bool>(false);

  @observable
  int offset = 0;

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
      final response = await pokemonService.fetchAllPokemons(
          offset: offset, limit: limit, allDataFetched: allDataFetched);
      pokemons.addAll(response);
      pokemonServiceState = PokemonServiceState.success;
      return response;
    } catch (e) {
      print(e);
      pokemonServiceState = PokemonServiceState.error;
      return [];
    }
  }
}
