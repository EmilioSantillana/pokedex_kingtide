import 'package:mobx/mobx.dart';

import '../../../core/services/i_pokemon_service.dart';
import '../../../core/services/pokemon_service_state.dart';
import '../../home/model/pokemon_model.dart';
import '../../home/viewModel/home_view_model.dart';

part 'show_view_model.g.dart';

class ShowViewModel = ShowViewModelBase with _$ShowViewModel;

abstract class ShowViewModelBase with Store {
  ShowViewModelBase(this.pokemonService, this.pokemon, this.homeViewModel);

  final IPokemonService pokemonService;
  final HomeViewModel homeViewModel;
  PokemonModel pokemon;

  @observable
  PokemonServiceState pokemonServiceState = PokemonServiceState.normal;

  @action
  Future<void> fetchPokemonService() async {
    pokemonServiceState = PokemonServiceState.loading;
    try {
      if(!pokemon.allFieldsNotNull()){
        PokemonModel? fetchedPokemonSpecie = await pokemonService.fetchPokemonSpecieById(pokemonId: pokemon.id!);
        PokemonModel? fetchedPokemonEvolutionChain = await pokemonService.fetchPokemonEvolutionChainById(evolutionId: fetchedPokemonSpecie!.evolutionId!);
        fetchedPokemonSpecie = fetchedPokemonSpecie.merge(fetchedPokemonEvolutionChain!);
        pokemon = pokemon.merge(fetchedPokemonSpecie);
        
        // Encuentra el primer Pokémon en el conjunto que tenga el mismo ID que el Pokémon dado
        final existingPokemon = homeViewModel.pokemons.firstWhere(
          (currentPokemon) => currentPokemon!.id == pokemon.id
        );
        // Elimina el Pokémon existente del conjunto
        homeViewModel.pokemons.remove(existingPokemon);

        // Agrega el nuevo Pokémon al conjunto
        homeViewModel.pokemons.add(pokemon);
        homeViewModel.filterPokemonsService();
      }
      pokemonServiceState = PokemonServiceState.success;
    } catch (e) {
      print(e);
      pokemonServiceState = PokemonServiceState.error;
    }
  }
}