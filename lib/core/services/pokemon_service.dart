import 'dart:io';

import '../../home/model/pokemon_model.dart';
import 'i_pokemon_service.dart';

class PokemonService extends IPokemonService {
  PokemonService(super.dio);

  @override
  Future<List<PokemonModel?>> fetchAllPokemons(
      {required int offset, required int limit}) async {
    List<String> generation1PokemonsName =
        await fetchPokemonsNameByGeneration(generationId: 1);
    List<String> generation2PokemonsName =
        await fetchPokemonsNameByGeneration(generationId: 2);

    List<String> allPokemonsName = [];
    allPokemonsName.addAll(generation1PokemonsName);
    allPokemonsName.addAll(generation2PokemonsName);

    // Verificar que el offset no superen los límites de la lista.
    if (offset >= allPokemonsName.length) {
      return [];
    }

    // Ajustar el límite si supera el tamaño de la lista.
    limit = limit.clamp(0, allPokemonsName.length - offset);

    allPokemonsName = allPokemonsName.sublist(offset, offset + limit);
    List<Future<PokemonModel?>> allFuturePokemons = allPokemonsName
        .map((name) => fetchPokemonByName(pokemonName: name))
        .toList();
    List<PokemonModel?> pokemonList = await Future.wait(allFuturePokemons);

    return pokemonList;
  }

  @override
  Future<List<String>> fetchPokemonsNameByGeneration({
    required int generationId,
  }) async {
    final response = await dio.get('generation/$generationId/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data['pokemon_species'] as List;
      return data
          .map((item) => item['name'] != null ? item['name'] as String : "")
          .toList();
    }
    return [];
  }

  @override
  Future<PokemonModel?> fetchPokemonById({required int pokemonId}) async {
    final response = await dio.get('pokemon/$pokemonId/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data as Map<String, dynamic>;

      // Agregar valor svg
      data['svg_url'] =
          data['sprites']['other']['dream_world']['front_default'];

      PokemonModel pokemon = PokemonModel.fromJson(data);
      return pokemon;
    }
    return null;
  }

  @override
  Future<PokemonModel?> fetchPokemonByName(
      {required String pokemonName}) async {
    final response = await dio.get('pokemon/$pokemonName/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data as Map<String, dynamic>;

      // Agregar valor svg
      data['svg_url'] =
          data['sprites']['other']['dream_world']['front_default'];

      PokemonModel pokemon = PokemonModel.fromJson(data);
      return pokemon;
    }
    return null;
  }
}
