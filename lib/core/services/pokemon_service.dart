import 'dart:io';

import '../../home/model/pokemon_model.dart';
import 'i_pokemon_service.dart';

class PokemonService extends IPokemonService {
  PokemonService(super.dio);

  @override
  Future<List<PokemonModel?>> fetchAllPokemons() async {
    List<PokemonModel?> generation1Pokemons = await fetchAllPokemonsByGeneration(generationId: 1);
    List<PokemonModel?> generation2Pokemons = await fetchAllPokemonsByGeneration(generationId: 2);

    // Concatenar las dos listas de pokemones
    List<PokemonModel?> allPokemons = [];
    allPokemons.addAll(generation1Pokemons);
    allPokemons.addAll(generation2Pokemons);

    return allPokemons;
  }

  @override
  Future<List<PokemonModel?>> fetchAllPokemonsByGeneration(
      {required int generationId}) async {
    final response = await dio.get('generation/$generationId/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data['pokemon_species'] as List;
      List<Future<PokemonModel?>> pokemonFutures = data
          .map((entry) => fetchPokemonByName(pokemonName: entry['name']))
          .toList();
      List<PokemonModel?> pokemonList = await Future.wait(pokemonFutures);
      return pokemonList;
    }
    return [];
  }

  @override
  Future<PokemonModel?> fetchPokemonById({required int pokemonId}) async {
    final response = await dio.get('pokemon-species/$pokemonId/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data as Map<String, dynamic>;
      PokemonModel pokemon = PokemonModel.fromJson(data);
      return pokemon;
    }
    return null;
  }

  @override
  Future<PokemonModel?> fetchPokemonByName(
      {required String pokemonName}) async {
    final response = await dio.get('pokemon-species/$pokemonName/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data as Map<String, dynamic>;
      PokemonModel pokemon = PokemonModel.fromJson(data);
      return pokemon;
    }
    return null;
  }
}
