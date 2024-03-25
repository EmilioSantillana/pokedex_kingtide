import 'package:dio/dio.dart';

import '../../home/model/pokemon_model.dart';

abstract class IPokemonService {
  final Dio dio;
  IPokemonService(this.dio);

  Future<List<PokemonModel?>> fetchAllPokemons();
  Future<List<PokemonModel?>> fetchAllPokemonsByGeneration({required int generationId});
  Future<PokemonModel?> fetchPokemonById({required int pokemonId});
  Future<PokemonModel?> fetchPokemonByName({required String pokemonName});
}