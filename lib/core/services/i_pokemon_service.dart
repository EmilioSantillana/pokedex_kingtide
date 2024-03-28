import 'package:dio/dio.dart';

import '../../views/home/model/pokemon_model.dart';

abstract class IPokemonService {
  final Dio dio;
  IPokemonService(this.dio);

  Future<List<String>> fetchPokemonsNameByGeneration({required int generationId,});
  Future<PokemonModel?> fetchPokemonById({required int pokemonId});
  Future<PokemonModel?> fetchPokemonByName({required String pokemonName});
}
