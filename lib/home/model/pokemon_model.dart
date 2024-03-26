import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

@freezed
class PokemonModel with _$PokemonModel {
  const factory PokemonModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'order') int? order,
    @JsonKey(name: 'gender_rate') int? genderRate,
    @JsonKey(name: 'capture_rate') int? captureRate,
    @JsonKey(name: 'base_happiness') int? baseHappiness,
    @JsonKey(name: 'is_baby') bool? isBaby,
    @JsonKey(name: 'is_legendary') bool? isLegendary,
    @JsonKey(name: 'is_mythical') bool? isMythical,
    @JsonKey(name: 'hatch_counter') int? hatchCounter,
    @JsonKey(name: 'svg_url') String? svgUrl,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);
}
