import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

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
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);
}
