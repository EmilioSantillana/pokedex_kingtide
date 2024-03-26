import 'package:dio/dio.dart';

import '../../home/model/pokemon_model.dart';
import '../utils/primitive_wrapper.dart';

abstract class IPokemonService {
  final Dio dio;
  IPokemonService(this.dio);
  List<String> allPokemonsName = [];

  Future<List<PokemonModel?>> fetchAllPokemons({required int offset, required int limit, required PrimitiveWrapper<bool> allDataFetched,});
  Future<List<String>> fetchPokemonsNameByGeneration({required int generationId,});
  Future<PokemonModel?> fetchPokemonById({required int pokemonId});
  Future<PokemonModel?> fetchPokemonByName({required String pokemonName});
}
