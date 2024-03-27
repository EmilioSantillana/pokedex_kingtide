import 'package:mobx/mobx.dart';

import '../../../core/utils/primitive_wrapper.dart';
import '../../../core/services/i_pokemon_service.dart';
import '../model/pokemon_model.dart';

part 'home_view_model.g.dart';

enum PokemonServiceState { loading, error, success, normal }

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  HomeViewModelBase(this.pokemonService);

  final IPokemonService pokemonService;

  final int initialLimit = 100;

  @observable
  int offset = 0;

  @observable
  PrimitiveWrapper<bool> allDataFetched = PrimitiveWrapper<bool>(false);

  @observable
  List<PokemonModel?> pokemons = [];

  @observable
  List<PokemonModel?> filteredPokemons = [];

  @observable
  bool isFiltered = false;

  @observable
  PokemonServiceState pokemonServiceState = PokemonServiceState.normal;

  @action
  Future<void> fetchAllPokemonService() async {
    pokemonServiceState = PokemonServiceState.loading;
    try {
      final response = await pokemonService.fetchAllPokemons(
        offset: offset, 
        limit: initialLimit, 
        allDataFetched: allDataFetched
      );
      pokemons.addAll(response);
      filteredPokemons = pokemons;
      pokemonServiceState = PokemonServiceState.success;
    } catch (e) {
      print(e);
      pokemonServiceState = PokemonServiceState.error;
    }
  }
}
