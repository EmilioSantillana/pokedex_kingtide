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
  fairy,
  stellar
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
    @JsonKey(name: 'is_default') bool? isDefault,
    @JsonKey(name: 'svg_url') String? svgUrl,
    Set<PokemonTypes>? types,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);
}
