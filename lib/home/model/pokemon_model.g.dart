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
      gender_rate: json['gender_rate'] as int?,
      capture_rate: json['capture_rate'] as int?,
      base_happiness: json['base_happiness'] as int?,
      is_baby: json['is_baby'] as bool?,
      is_legendary: json['is_legendary'] as bool?,
      is_mythical: json['is_mythical'] as bool?,
      hatch_counter: json['hatch_counter'] as int?,
    );

Map<String, dynamic> _$$PokemonModelImplToJson(_$PokemonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'gender_rate': instance.gender_rate,
      'capture_rate': instance.capture_rate,
      'base_happiness': instance.base_happiness,
      'is_baby': instance.is_baby,
      'is_legendary': instance.is_legendary,
      'is_mythical': instance.is_mythical,
      'hatch_counter': instance.hatch_counter,
    };
