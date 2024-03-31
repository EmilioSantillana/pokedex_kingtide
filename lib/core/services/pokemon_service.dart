import 'dart:io';

import '../../views/home/model/pokemon_model.dart';
import 'i_pokemon_service.dart';

class PokemonService extends IPokemonService {
  PokemonService(super.dio);

  @override
  Future<List<String>> fetchPokemonsNameByGeneration({required int generationId}) async {
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
  Future<List<String>> fetchPokemonsNameByType({required PokemonTypes pokemonType}) async{
    final response = await dio.get('type/${pokemonType.name}/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data['pokemon'] as List;

      //Función para extraer el ID de la URL
      int getIdFromUrl(String url) {
        final parts = url.split('/');
        return int.tryParse(parts[parts.length - 2]) ?? 0;
      }

      //Ordenar los datos por ID
      data.sort((a, b) {
        final idA = getIdFromUrl(a['pokemon']['url']);
        final idB = getIdFromUrl(b['pokemon']['url']);
        return idA.compareTo(idB);
      });

      String getPokemonName(Map<String, dynamic> pokemonData) {
        return pokemonData['pokemon']['name'];
      }
      return data.map((item) => getPokemonName(item)).toList();
    }
    return [];
  }

  @override
  Future<PokemonModel?> fetchPokemonByName({required String pokemonName}) async {
    final response = await dio.get('pokemon/$pokemonName/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data as Map<String, dynamic>;

      data['svg_url'] = data['sprites']['other']['dream_world']['front_default'];

      data['base_hp'] = data['stats'][0]['base_stat'];
      data['base_attack'] = data['stats'][1]['base_stat'];
      data['base_defense'] = data['stats'][2]['base_stat'];
      data['base_special_attack'] = data['stats'][3]['base_stat'];
      data['base_special_defense'] = data['stats'][4]['base_stat'];
      data['base_speed'] = data['stats'][5]['base_stat'];

      data['types'] = data['types'].map<String>((type) => type['type']['name'] as String).toList();

      PokemonModel pokemon = PokemonModel.fromJson(data);
      return pokemon;
    }
    return null;
  }

  @override
  Future<PokemonModel?> fetchPokemonSpecieById({required int pokemonId}) async {
    final response = await dio.get('pokemon-species/$pokemonId/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data as Map<String, dynamic>;

      //Función para extraer el ID de la URL
      int getIdFromUrl(String url) {
        final parts = url.split('/');
        return int.tryParse(parts[parts.length - 2]) ?? 0;
      }
      data['evolution_id'] = getIdFromUrl(data['evolution_chain']['url']);

      String flavorTextEnglish(List<dynamic> entries) {
        for (var entry in entries) {
          if (entry["language"]["name"] == "en") {
            return entry["flavor_text"];
          }
        }
        return "Not Found";
      }
      data['flavor_text'] = flavorTextEnglish(data['flavor_text_entries']);

      PokemonModel pokemon = PokemonModel.fromJson(data);
      return pokemon;
    }
    return null;
  }

  @override
  Future<PokemonModel?> fetchPokemonEvolutionChainById({required int evolutionId}) async {
    final response = await dio.get('evolution-chain/$evolutionId/');
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data as Map<String, dynamic>;

      List<String> getEvolutions(Map<String, dynamic> chain) {
        List<String> evolutions = [];
        if (chain.containsKey('species')) {
          evolutions.add(chain['species']['name']);
        }
        if (chain.containsKey('evolves_to')) {
          for (var evolve in chain['evolves_to']) {
            evolutions.addAll(getEvolutions(evolve));
          }
        }
        return evolutions;
      }
      List<String> pokemonsNameEvolution = getEvolutions(data['chain']).toList();

      List<Map<String, dynamic>> pokemonEvolutions = [];
      for (var name in pokemonsNameEvolution) {
        PokemonModel? pokemon  = await fetchPokemonByName(pokemonName: name);
        pokemonEvolutions.add(pokemon!.toJson());
      }
      data['pokemon_evolutions'] = pokemonEvolutions;
      data.remove('id');

      PokemonModel pokemon = PokemonModel.fromJson(data);
      return pokemon;
    }
    return null;
  }
}
