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
    };
