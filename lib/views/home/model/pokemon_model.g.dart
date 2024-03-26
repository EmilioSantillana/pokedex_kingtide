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
      isDefault: json['is_default'] as bool?,
      svgUrl: json['svg_url'] as String?,
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$PokemonTypesEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$PokemonModelImplToJson(_$PokemonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'height': instance.height,
      'weight': instance.weight,
      'base_experience': instance.baseExperience,
      'is_default': instance.isDefault,
      'svg_url': instance.svgUrl,
      'types': instance.types?.map((e) => _$PokemonTypesEnumMap[e]!).toList(),
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
  PokemonTypes.stellar: 'stellar',
};
