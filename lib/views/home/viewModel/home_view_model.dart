import 'package:mobx/mobx.dart';

import '../../../core/services/i_pokemon_service.dart';
import '../../../core/services/pokemon_service_state.dart';
import '../model/pokemon_model.dart';

part 'home_view_model.g.dart';

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
  bool isFiltered = false;

  @observable
  bool isFirstLoad = true;

  @observable
  Set<String> allPokemonsName = {};

  @observable
  Set<PokemonModel?> pokemons = {};

  @observable
  Set<PokemonModel?> filteredPokemons = {};

  @observable
  Set<PokemonTypes> selectedPokemonTypes = {};

  @observable
  String searchText = '';

  @observable
  PokemonServiceState pokemonServiceState = PokemonServiceState.normal;

  @action
  Future<void> fetchAllPokemonService() async {
    pokemonServiceState = PokemonServiceState.loading;
    try {
      //Obtenemos la lista de nombres de pokemones por consumir
      if(allPokemonsName.isEmpty){
        await _fetchAllPokemonsName();
      }
      //Consumimos todos los pokemones usando paginacion
      await _fetchAllPokemonsWithPagination();

      //Filtramos pokemones
      await _filterPokemons();

      await _success();
      pokemonServiceState = PokemonServiceState.success;
    } catch (e) {
      print(e);
      pokemonServiceState = PokemonServiceState.error;
    }
  }

  @action
  Future<void> filterPokemonsService() async{
    pokemonServiceState = PokemonServiceState.loading;
    try {
      //Filtramos pokemones
      await _filterPokemons();

      await _success();
      pokemonServiceState = PokemonServiceState.success;
    }
    catch (e) {
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

  Future<void> _fetchAllPokemonsWithPagination() async {
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

    //Obtener los pokemones que aun no se han consumido
    final List<Future<PokemonModel?>> allFuturePokemons = paginatedPokemonsName
      .where((name) => !pokemons.any(
        (pokemon) => pokemon!.name == name
      ))
      .map((name) => pokemonService.fetchPokemonByName(pokemonName: name)).toList();
    
    //Agregar pokemones a la lista de pokemones
    final List<PokemonModel?> pokemonsList = await Future.wait(allFuturePokemons);
    pokemons.addAll(pokemonsList);
  }

  Future<void> _fetchPokemonsByNames({required List<String> pokemonsNames}) async{
    //Obtener pokemones
    final List<Future<PokemonModel?>> allFuturePokemons = pokemonsNames
      .map(
        (name) => pokemonService.fetchPokemonByName(pokemonName: name)
      ).toList();
    
    //Agregar pokemones a la lista de pokemones
    final List<PokemonModel?> pokemonsList = await Future.wait(allFuturePokemons);
    pokemons.addAll(pokemonsList);
  }

  Future<void> _filterPokemons() async{
    filteredPokemons = {};
    if (searchText.isNotEmpty) {
      //Obtener nombres de pokemones que satisfagan la busqueda aun sin consumir de la api
      final filteredNoFetchedPokemonsName = allPokemonsName
        .where(
          (name) => name.toLowerCase().contains(searchText.toLowerCase())
        )
        .where(
          (name) => !pokemons.any(
            (pokemon) => pokemon!.name!.toLowerCase() == name.toLowerCase()
          )
        ).toList();
      
      //Si hay pokemones sin consumir los consumimos de la api
      if (filteredNoFetchedPokemonsName.isNotEmpty){
        await _fetchPokemonsByNames(pokemonsNames: filteredNoFetchedPokemonsName);
      }
    }

    if(selectedPokemonTypes.isNotEmpty){
      List<String> pokemonsName = [];
      //Obtenemos nombres de pokemones por tipo
      for (var type in selectedPokemonTypes) {
        pokemonsName.addAll(await pokemonService.fetchPokemonsNameByType(pokemonType: type));
      }

      //Obtener nombres de pokemones que si esten dentro de mi lista allPokemonsName
      final List<String> filteredPokemonsName = allPokemonsName.where((name) => pokemonsName.contains(name)).toList();
      
      //Obtener nombres de pokemones que satisfagan la busqueda aun sin consumir de la api
      final List<String> filteredNoFetchedPokemonsName = filteredPokemonsName
        .where(
          (name) => name.toLowerCase().contains(searchText.toLowerCase())
        )
        .where(
          (name) => !pokemons.any(
            (pokemon) => pokemon!.name!.toLowerCase() == name.toLowerCase()
          )
        ).toList();
      
      //Si hay pokemones sin consumir los consumimos de la api
      if (filteredNoFetchedPokemonsName.isNotEmpty){
        await _fetchPokemonsByNames(pokemonsNames: filteredNoFetchedPokemonsName);
      }
    }

    if(searchText.isEmpty && selectedPokemonTypes.isEmpty){
      //No hay filtro
      filteredPokemons = pokemons;
    }
    else{
      //Agregamos los pokemones filtrados a la lista de filtrados
      filteredPokemons.addAll(pokemons
        .where((pokemon) => 
          pokemon!.name!.toLowerCase().contains(searchText.toLowerCase()) 
          && selectedPokemonTypes.every((type) => pokemon.types!.contains(type))
        )
      );
    }

    //Primera Carga
    if(isFirstLoad){
      filteredPokemons = pokemons;
      isFirstLoad = false;
    }
  }

  Future<void> _success() async{
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

    //Hemos consumido todos pokemones
    allDataFetched = pokemons.length == allPokemonsName.length;

    //Los pokemones estan filtrados
    isFiltered = filteredPokemons.length < pokemons.length;
  }
}
