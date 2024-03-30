import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

enum PokemonTypes {
  normal,
  fire,
  water,
  grass,
  electric,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  steel,
  dark,
  fairy
}

@freezed
class PokemonModel with _$PokemonModel {
  const factory PokemonModel({
    int? id,
    String? name,
    int? order,
    int? height,
    int? weight,
    @JsonKey(name: 'base_experience') int? baseExperience,
    @JsonKey(name: 'base_hp') int? baseStat,
    @JsonKey(name: 'base_attack') int? baseAttack,
    @JsonKey(name: 'base_defense') int? baseDefense,
    @JsonKey(name: 'base_special_attack') int? baseSpecialAttack,
    @JsonKey(name: 'base_special_defense') int? baseSpecialDefense,
    @JsonKey(name: 'base_speed') int? baseSpeed,
    @JsonKey(name: 'is_default') bool? isDefault,
    @JsonKey(name: 'svg_url') String? svgUrl,
    Set<PokemonTypes>? types,

    @JsonKey(name: 'base_happiness') int? baseHappiness,
    @JsonKey(name: 'capture_rate') int? captureRate,
    @JsonKey(name: 'is_baby') bool? isBaby,
    @JsonKey(name: 'is_legendary') bool? isLegendary,
    @JsonKey(name: 'is_mythical') bool? isMythical,
    @JsonKey(name: 'evolution_id') int? evolutionId,
    @JsonKey(name: 'pokemon_evolutions') Set<String>? pokemonEvolutions,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json); 
}

extension PokemonModelExtension on PokemonModel {
  bool allFieldsNotNull() {
    return id != null &&
        name != null &&
        order != null &&
        height != null &&
        weight != null &&
        baseExperience != null &&
        baseStat != null &&
        baseAttack != null &&
        baseDefense != null &&
        baseSpecialAttack != null &&
        baseSpecialDefense != null &&
        baseSpeed != null &&
        isDefault != null &&
        svgUrl != null &&
        types != null &&
        baseHappiness != null &&
        captureRate != null &&
        isBaby != null &&
        isLegendary != null &&
        isMythical != null &&
        evolutionId != null &&
        pokemonEvolutions != null;
  }

  PokemonModel merge(PokemonModel other) {
    return PokemonModel(
      id: other.id ?? id,
      name: other.name ?? name,
      order: other.order ?? order,
      height: other.height ?? height,
      weight: other.weight ?? weight,
      baseExperience: other.baseExperience ?? baseExperience,
      baseStat: other.baseStat ?? baseStat,
      baseAttack: other.baseAttack ?? baseAttack,
      baseDefense: other.baseDefense ?? baseDefense,
      baseSpecialAttack: other.baseSpecialAttack ?? baseSpecialAttack,
      baseSpecialDefense: other.baseSpecialDefense ?? baseSpecialDefense,
      baseSpeed: other.baseSpeed ?? baseSpeed,
      isDefault: other.isDefault ?? isDefault,
      svgUrl: other.svgUrl ?? svgUrl,
      types: other.types ?? types,
      baseHappiness: other.baseHappiness ?? baseHappiness,
      captureRate: other.captureRate ?? captureRate,
      isBaby: other.isBaby ?? isBaby,
      isLegendary: other.isLegendary ?? isLegendary,
      isMythical: other.isMythical ?? isMythical,
      evolutionId: other.evolutionId ?? evolutionId,
      pokemonEvolutions: other.pokemonEvolutions ?? pokemonEvolutions,
    );
  }
}
