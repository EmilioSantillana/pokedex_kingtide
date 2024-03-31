// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonModelImpl _$$PokemonModelImplFromJson(Map<String, dynamic> json) =>
    _$PokemonModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      order: json['order'] as int?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      baseExperience: json['base_experience'] as int?,
      baseHp: json['base_hp'] as int?,
      baseAttack: json['base_attack'] as int?,
      baseDefense: json['base_defense'] as int?,
      baseSpecialAttack: json['base_special_attack'] as int?,
      baseSpecialDefense: json['base_special_defense'] as int?,
      baseSpeed: json['base_speed'] as int?,
      isDefault: json['is_default'] as bool?,
      svgUrl: json['svg_url'] as String?,
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$PokemonTypesEnumMap, e))
          .toSet(),
      flavorText: json['flavor_text'] as String?,
      baseHappiness: json['base_happiness'] as int?,
      captureRate: json['capture_rate'] as int?,
      isBaby: json['is_baby'] as bool?,
      isLegendary: json['is_legendary'] as bool?,
      isMythical: json['is_mythical'] as bool?,
      evolutionId: json['evolution_id'] as int?,
      pokemonEvolutions: (json['pokemon_evolutions'] as List<dynamic>?)
          ?.map((e) => PokemonModel.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$$PokemonModelImplToJson(_$PokemonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'height': instance.height,
      'weight': instance.weight,
      'base_experience': instance.baseExperience,
      'base_hp': instance.baseHp,
      'base_attack': instance.baseAttack,
      'base_defense': instance.baseDefense,
      'base_special_attack': instance.baseSpecialAttack,
      'base_special_defense': instance.baseSpecialDefense,
      'base_speed': instance.baseSpeed,
      'is_default': instance.isDefault,
      'svg_url': instance.svgUrl,
      'types': instance.types?.map((e) => _$PokemonTypesEnumMap[e]!).toList(),
      'flavor_text': instance.flavorText,
      'base_happiness': instance.baseHappiness,
      'capture_rate': instance.captureRate,
      'is_baby': instance.isBaby,
      'is_legendary': instance.isLegendary,
      'is_mythical': instance.isMythical,
      'evolution_id': instance.evolutionId,
      'pokemon_evolutions': instance.pokemonEvolutions?.toList(),
    };

const _$PokemonTypesEnumMap = {
  PokemonTypes.normal: 'normal',
  PokemonTypes.fire: 'fire',
  PokemonTypes.water: 'water',
  PokemonTypes.grass: 'grass',
  PokemonTypes.electric: 'electric',
  PokemonTypes.ice: 'ice',
  PokemonTypes.fighting: 'fighting',
  PokemonTypes.poison: 'poison',
  PokemonTypes.ground: 'ground',
  PokemonTypes.flying: 'flying',
  PokemonTypes.psychic: 'psychic',
  PokemonTypes.bug: 'bug',
  PokemonTypes.rock: 'rock',
  PokemonTypes.ghost: 'ghost',
  PokemonTypes.dragon: 'dragon',
  PokemonTypes.steel: 'steel',
  PokemonTypes.dark: 'dark',
  PokemonTypes.fairy: 'fairy',
};
