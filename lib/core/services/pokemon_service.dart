import 'dart:io';

import '../../views/home/model/pokemon_model.dart';
import 'i_pokemon_service.dart';

class PokemonService extends IPokemonService {
  PokemonService(super.dio);

  @override
  Future<List<String>> fetchPokemonsNameByGeneration({
    required int generationId,
  }) async {
    final response = await dio.get('generation/$generationId/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data['pokemon_species'] as List;

      //Función para extraer el ID de la URL
      int getIdFromUrl(String url) {
        final parts = url.split('/');
        return int.tryParse(parts[parts.length - 2]) ?? 0;
      }

      //Ordenar los datos por ID
      data.sort((a, b) {
        final idA = getIdFromUrl(a['url']);
        final idB = getIdFromUrl(b['url']);
        return idA.compareTo(idB);
      });

      return data.map((item) => item['name'] != null ? item['name'] as String : "").toList();
    }
    return [];
  }

  @override
  Future<PokemonModel?> fetchPokemonById({required int pokemonId}) async {
    final response = await dio.get('pokemon/$pokemonId/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data as Map<String, dynamic>;

      // Agregar valor svg
      data['svg_url'] = data['sprites']['other']['dream_world']['front_default'];

      PokemonModel pokemon = PokemonModel.fromJson(data);
      return pokemon;
    }
    return null;
  }

  @override
  Future<PokemonModel?> fetchPokemonByName({required String pokemonName}) async {
    final response = await dio.get('pokemon/$pokemonName/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data as Map<String, dynamic>;

      // Agregar valor svg
      data['svg_url'] = data['sprites']['other']['dream_world']['front_default'];

      List<String> typeNames = data['types'].map<String>((type) => type['type']['name'] as String).toList();
      data['types'] = typeNames;

      PokemonModel pokemon = PokemonModel.fromJson(data);
      return pokemon;
    }
    return null;
  }
}
