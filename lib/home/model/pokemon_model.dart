import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

@freezed
class PokemonModel with _$PokemonModel {
  const factory PokemonModel({
    int? id,
    String? name,
    int? order,
    int? gender_rate,
    int? capture_rate,
    int? base_happiness,
    bool? is_baby,
    bool? is_legendary,
    bool? is_mythical,
    int? hatch_counter,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);
}
