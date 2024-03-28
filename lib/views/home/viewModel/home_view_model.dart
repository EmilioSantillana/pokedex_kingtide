import 'package:mobx/mobx.dart';

import '../../../core/services/i_pokemon_service.dart';
import '../model/pokemon_model.dart';

part 'home_view_model.g.dart';

enum PokemonServiceState { loading, error, success, normal }

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  HomeViewModelBase(this.pokemonService);

  final IPokemonService pokemonService;

  @observable
  int currentLimit = 100;

  @observable
  int offset = 0;

  @observable
  bool allDataFetched = false;

  @observable
  Set<String> allPokemonsName = {};

  @observable
  Set<PokemonModel?> pokemons = {};

  @observable
  Set<PokemonModel?> filteredPokemons = {};

  @observable
  Set<PokemonTypes> selectedPokemonTypes = {};

  @observable
  bool isFiltered = false;

  @observable
  PokemonServiceState pokemonServiceState = PokemonServiceState.normal;

  @action
  Future<void> fetchAllPokemonService() async {
    pokemonServiceState = PokemonServiceState.loading;
    try {
      if(allPokemonsName.isEmpty){
        await _fetchAllPokemonsName();
      }
      await _fetchAllPokemons();

      // Ordenar la lista por ID
      void sortAndConvertListToSet(List<PokemonModel?> list) {
          list.sort((a, b) => a!.id!.compareTo(b!.id!));
      }
      final List<PokemonModel?> pokemonsList = pokemons.toList();
      final List<PokemonModel?> filteredPokemonsList = filteredPokemons.toList();
      sortAndConvertListToSet(pokemonsList);
      sortAndConvertListToSet(filteredPokemonsList);
      pokemons = Set<PokemonModel?>.from(pokemonsList);
      filteredPokemons = Set<PokemonModel?>.from(filteredPokemonsList);

      allDataFetched = pokemons.length == allPokemonsName.length;
      
      pokemonServiceState = PokemonServiceState.success;
    } catch (e) {
      print(e);
      pokemonServiceState = PokemonServiceState.error;
    }
  }

  @action
  Future<void> fetchPokemonsByNamesService({required List<String> pokemonsNames}) async {
    pokemonServiceState = PokemonServiceState.loading;
    try {
      await _fetchPokemonsByNames(pokemonsNames: pokemonsNames);

      // Ordenar la lista por ID
      void sortAndConvertListToSet(List<PokemonModel?> list) {
          list.sort((a, b) => a!.id!.compareTo(b!.id!));
      }
      final List<PokemonModel?> pokemonsList = pokemons.toList();
      final List<PokemonModel?> filteredPokemonsList = filteredPokemons.toList();
      sortAndConvertListToSet(pokemonsList);
      sortAndConvertListToSet(filteredPokemonsList);
      pokemons = Set<PokemonModel?>.from(pokemonsList);
      filteredPokemons = Set<PokemonModel?>.from(filteredPokemonsList);

      allDataFetched = pokemons.length == allPokemonsName.length;

      pokemonServiceState = PokemonServiceState.success;
    } catch (e) {
      print(e);
      pokemonServiceState = PokemonServiceState.error;
    }
  }

  Future<void> _fetchAllPokemonsName() async {
    List<String> generation1PokemonsName = await pokemonService.fetchPokemonsNameByGeneration(generationId: 1);
    List<String> generation2PokemonsName = await pokemonService.fetchPokemonsNameByGeneration(generationId: 2);

    allPokemonsName.addAll(generation1PokemonsName);
    allPokemonsName.addAll(generation2PokemonsName);
  }

  Future<void> _fetchAllPokemons() async {
    // Verificar que el offset no superen los límites de la lista.
    if (offset >= allPokemonsName.length) {
      offset = allPokemonsName.length;
      return;
    }

    // Ajustar el límite si supera el tamaño de la lista.
    final int newlimit = currentLimit.clamp(0, allPokemonsName.length - offset);

    //Paginacion
    final List<String> paginatedPokemonsName = allPokemonsName.toList().sublist(offset, offset + newlimit);
    offset += currentLimit;

    //Obtener pokemones por nombre y quitar los existentes
    final List<Future<PokemonModel?>> allFuturePokemons = paginatedPokemonsName
      .where((name) => !pokemons.any(
        (pokemon) => pokemon!.name == name
      ))
      .map((name) => pokemonService.fetchPokemonByName(pokemonName: name)).toList();
    
    //Agregar pokemones a la lista de pokemones
    final List<PokemonModel?> pokemonsList = await Future.wait(allFuturePokemons);
    pokemons.addAll(pokemonsList);
    filteredPokemons.addAll(pokemonsList);
  }

  Future<void> _fetchPokemonsByNames({required List<String> pokemonsNames}) async{
    //Obtener pokemones por nombre y quitar los existentes
    final List<Future<PokemonModel?>> allFuturePokemons = pokemonsNames
      .where((name) => !pokemons.any(
        (pokemon) => pokemon!.name == name
      ))
      .map((name) => pokemonService.fetchPokemonByName(pokemonName: name)).toList();
    
    //Agregar pokemones a la lista de pokemones
    final List<PokemonModel?> pokemonsList = await Future.wait(allFuturePokemons);
    pokemons.addAll(pokemonsList);
    filteredPokemons.addAll(pokemonsList);
  }
}
