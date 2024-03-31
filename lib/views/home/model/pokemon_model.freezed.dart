// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) {
  return _PokemonModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_experience')
  int? get baseExperience => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_hp')
  int? get baseStat => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_attack')
  int? get baseAttack => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_defense')
  int? get baseDefense => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_special_attack')
  int? get baseSpecialAttack => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_special_defense')
  int? get baseSpecialDefense => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_speed')
  int? get baseSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default')
  bool? get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'svg_url')
  String? get svgUrl => throw _privateConstructorUsedError;
  Set<PokemonTypes>? get types => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_happiness')
  int? get baseHappiness => throw _privateConstructorUsedError;
  @JsonKey(name: 'capture_rate')
  int? get captureRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_baby')
  bool? get isBaby => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_legendary')
  bool? get isLegendary => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_mythical')
  bool? get isMythical => throw _privateConstructorUsedError;
  @JsonKey(name: 'evolution_id')
  int? get evolutionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'pokemon_evolutions')
  Set<PokemonModel>? get pokemonEvolutions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonModelCopyWith<PokemonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonModelCopyWith<$Res> {
  factory $PokemonModelCopyWith(
          PokemonModel value, $Res Function(PokemonModel) then) =
      _$PokemonModelCopyWithImpl<$Res, PokemonModel>;
  @useResult
  $Res call(
      {int? id,
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
      @JsonKey(name: 'pokemon_evolutions')
      Set<PokemonModel>? pokemonEvolutions});
}

/// @nodoc
class _$PokemonModelCopyWithImpl<$Res, $Val extends PokemonModel>
    implements $PokemonModelCopyWith<$Res> {
  _$PokemonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? order = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? baseExperience = freezed,
    Object? baseStat = freezed,
    Object? baseAttack = freezed,
    Object? baseDefense = freezed,
    Object? baseSpecialAttack = freezed,
    Object? baseSpecialDefense = freezed,
    Object? baseSpeed = freezed,
    Object? isDefault = freezed,
    Object? svgUrl = freezed,
    Object? types = freezed,
    Object? baseHappiness = freezed,
    Object? captureRate = freezed,
    Object? isBaby = freezed,
    Object? isLegendary = freezed,
    Object? isMythical = freezed,
    Object? evolutionId = freezed,
    Object? pokemonEvolutions = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      baseExperience: freezed == baseExperience
          ? _value.baseExperience
          : baseExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      baseStat: freezed == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int?,
      baseAttack: freezed == baseAttack
          ? _value.baseAttack
          : baseAttack // ignore: cast_nullable_to_non_nullable
              as int?,
      baseDefense: freezed == baseDefense
          ? _value.baseDefense
          : baseDefense // ignore: cast_nullable_to_non_nullable
              as int?,
      baseSpecialAttack: freezed == baseSpecialAttack
          ? _value.baseSpecialAttack
          : baseSpecialAttack // ignore: cast_nullable_to_non_nullable
              as int?,
      baseSpecialDefense: freezed == baseSpecialDefense
          ? _value.baseSpecialDefense
          : baseSpecialDefense // ignore: cast_nullable_to_non_nullable
              as int?,
      baseSpeed: freezed == baseSpeed
          ? _value.baseSpeed
          : baseSpeed // ignore: cast_nullable_to_non_nullable
              as int?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      svgUrl: freezed == svgUrl
          ? _value.svgUrl
          : svgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as Set<PokemonTypes>?,
      baseHappiness: freezed == baseHappiness
          ? _value.baseHappiness
          : baseHappiness // ignore: cast_nullable_to_non_nullable
              as int?,
      captureRate: freezed == captureRate
          ? _value.captureRate
          : captureRate // ignore: cast_nullable_to_non_nullable
              as int?,
      isBaby: freezed == isBaby
          ? _value.isBaby
          : isBaby // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLegendary: freezed == isLegendary
          ? _value.isLegendary
          : isLegendary // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMythical: freezed == isMythical
          ? _value.isMythical
          : isMythical // ignore: cast_nullable_to_non_nullable
              as bool?,
      evolutionId: freezed == evolutionId
          ? _value.evolutionId
          : evolutionId // ignore: cast_nullable_to_non_nullable
              as int?,
      pokemonEvolutions: freezed == pokemonEvolutions
          ? _value.pokemonEvolutions
          : pokemonEvolutions // ignore: cast_nullable_to_non_nullable
              as Set<PokemonModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonModelImplCopyWith<$Res>
    implements $PokemonModelCopyWith<$Res> {
  factory _$$PokemonModelImplCopyWith(
          _$PokemonModelImpl value, $Res Function(_$PokemonModelImpl) then) =
      __$$PokemonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
      @JsonKey(name: 'pokemon_evolutions')
      Set<PokemonModel>? pokemonEvolutions});
}

/// @nodoc
class __$$PokemonModelImplCopyWithImpl<$Res>
    extends _$PokemonModelCopyWithImpl<$Res, _$PokemonModelImpl>
    implements _$$PokemonModelImplCopyWith<$Res> {
  __$$PokemonModelImplCopyWithImpl(
      _$PokemonModelImpl _value, $Res Function(_$PokemonModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? order = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? baseExperience = freezed,
    Object? baseStat = freezed,
    Object? baseAttack = freezed,
    Object? baseDefense = freezed,
    Object? baseSpecialAttack = freezed,
    Object? baseSpecialDefense = freezed,
    Object? baseSpeed = freezed,
    Object? isDefault = freezed,
    Object? svgUrl = freezed,
    Object? types = freezed,
    Object? baseHappiness = freezed,
    Object? captureRate = freezed,
    Object? isBaby = freezed,
    Object? isLegendary = freezed,
    Object? isMythical = freezed,
    Object? evolutionId = freezed,
    Object? pokemonEvolutions = freezed,
  }) {
    return _then(_$PokemonModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      baseExperience: freezed == baseExperience
          ? _value.baseExperience
          : baseExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      baseStat: freezed == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int?,
      baseAttack: freezed == baseAttack
          ? _value.baseAttack
          : baseAttack // ignore: cast_nullable_to_non_nullable
              as int?,
      baseDefense: freezed == baseDefense
          ? _value.baseDefense
          : baseDefense // ignore: cast_nullable_to_non_nullable
              as int?,
      baseSpecialAttack: freezed == baseSpecialAttack
          ? _value.baseSpecialAttack
          : baseSpecialAttack // ignore: cast_nullable_to_non_nullable
              as int?,
      baseSpecialDefense: freezed == baseSpecialDefense
          ? _value.baseSpecialDefense
          : baseSpecialDefense // ignore: cast_nullable_to_non_nullable
              as int?,
      baseSpeed: freezed == baseSpeed
          ? _value.baseSpeed
          : baseSpeed // ignore: cast_nullable_to_non_nullable
              as int?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      svgUrl: freezed == svgUrl
          ? _value.svgUrl
          : svgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as Set<PokemonTypes>?,
      baseHappiness: freezed == baseHappiness
          ? _value.baseHappiness
          : baseHappiness // ignore: cast_nullable_to_non_nullable
              as int?,
      captureRate: freezed == captureRate
          ? _value.captureRate
          : captureRate // ignore: cast_nullable_to_non_nullable
              as int?,
      isBaby: freezed == isBaby
          ? _value.isBaby
          : isBaby // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLegendary: freezed == isLegendary
          ? _value.isLegendary
          : isLegendary // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMythical: freezed == isMythical
          ? _value.isMythical
          : isMythical // ignore: cast_nullable_to_non_nullable
              as bool?,
      evolutionId: freezed == evolutionId
          ? _value.evolutionId
          : evolutionId // ignore: cast_nullable_to_non_nullable
              as int?,
      pokemonEvolutions: freezed == pokemonEvolutions
          ? _value._pokemonEvolutions
          : pokemonEvolutions // ignore: cast_nullable_to_non_nullable
              as Set<PokemonModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonModelImpl implements _PokemonModel {
  const _$PokemonModelImpl(
      {this.id,
      this.name,
      this.order,
      this.height,
      this.weight,
      @JsonKey(name: 'base_experience') this.baseExperience,
      @JsonKey(name: 'base_hp') this.baseStat,
      @JsonKey(name: 'base_attack') this.baseAttack,
      @JsonKey(name: 'base_defense') this.baseDefense,
      @JsonKey(name: 'base_special_attack') this.baseSpecialAttack,
      @JsonKey(name: 'base_special_defense') this.baseSpecialDefense,
      @JsonKey(name: 'base_speed') this.baseSpeed,
      @JsonKey(name: 'is_default') this.isDefault,
      @JsonKey(name: 'svg_url') this.svgUrl,
      final Set<PokemonTypes>? types,
      @JsonKey(name: 'base_happiness') this.baseHappiness,
      @JsonKey(name: 'capture_rate') this.captureRate,
      @JsonKey(name: 'is_baby') this.isBaby,
      @JsonKey(name: 'is_legendary') this.isLegendary,
      @JsonKey(name: 'is_mythical') this.isMythical,
      @JsonKey(name: 'evolution_id') this.evolutionId,
      @JsonKey(name: 'pokemon_evolutions')
      final Set<PokemonModel>? pokemonEvolutions})
      : _types = types,
        _pokemonEvolutions = pokemonEvolutions;

  factory _$PokemonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? order;
  @override
  final int? height;
  @override
  final int? weight;
  @override
  @JsonKey(name: 'base_experience')
  final int? baseExperience;
  @override
  @JsonKey(name: 'base_hp')
  final int? baseStat;
  @override
  @JsonKey(name: 'base_attack')
  final int? baseAttack;
  @override
  @JsonKey(name: 'base_defense')
  final int? baseDefense;
  @override
  @JsonKey(name: 'base_special_attack')
  final int? baseSpecialAttack;
  @override
  @JsonKey(name: 'base_special_defense')
  final int? baseSpecialDefense;
  @override
  @JsonKey(name: 'base_speed')
  final int? baseSpeed;
  @override
  @JsonKey(name: 'is_default')
  final bool? isDefault;
  @override
  @JsonKey(name: 'svg_url')
  final String? svgUrl;
  final Set<PokemonTypes>? _types;
  @override
  Set<PokemonTypes>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableSetView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  @JsonKey(name: 'base_happiness')
  final int? baseHappiness;
  @override
  @JsonKey(name: 'capture_rate')
  final int? captureRate;
  @override
  @JsonKey(name: 'is_baby')
  final bool? isBaby;
  @override
  @JsonKey(name: 'is_legendary')
  final bool? isLegendary;
  @override
  @JsonKey(name: 'is_mythical')
  final bool? isMythical;
  @override
  @JsonKey(name: 'evolution_id')
  final int? evolutionId;
  final Set<PokemonModel>? _pokemonEvolutions;
  @override
  @JsonKey(name: 'pokemon_evolutions')
  Set<PokemonModel>? get pokemonEvolutions {
    final value = _pokemonEvolutions;
    if (value == null) return null;
    if (_pokemonEvolutions is EqualUnmodifiableSetView)
      return _pokemonEvolutions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  String toString() {
    return 'PokemonModel(id: $id, name: $name, order: $order, height: $height, weight: $weight, baseExperience: $baseExperience, baseStat: $baseStat, baseAttack: $baseAttack, baseDefense: $baseDefense, baseSpecialAttack: $baseSpecialAttack, baseSpecialDefense: $baseSpecialDefense, baseSpeed: $baseSpeed, isDefault: $isDefault, svgUrl: $svgUrl, types: $types, baseHappiness: $baseHappiness, captureRate: $captureRate, isBaby: $isBaby, isLegendary: $isLegendary, isMythical: $isMythical, evolutionId: $evolutionId, pokemonEvolutions: $pokemonEvolutions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.baseExperience, baseExperience) ||
                other.baseExperience == baseExperience) &&
            (identical(other.baseStat, baseStat) ||
                other.baseStat == baseStat) &&
            (identical(other.baseAttack, baseAttack) ||
                other.baseAttack == baseAttack) &&
            (identical(other.baseDefense, baseDefense) ||
                other.baseDefense == baseDefense) &&
            (identical(other.baseSpecialAttack, baseSpecialAttack) ||
                other.baseSpecialAttack == baseSpecialAttack) &&
            (identical(other.baseSpecialDefense, baseSpecialDefense) ||
                other.baseSpecialDefense == baseSpecialDefense) &&
            (identical(other.baseSpeed, baseSpeed) ||
                other.baseSpeed == baseSpeed) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.svgUrl, svgUrl) || other.svgUrl == svgUrl) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.baseHappiness, baseHappiness) ||
                other.baseHappiness == baseHappiness) &&
            (identical(other.captureRate, captureRate) ||
                other.captureRate == captureRate) &&
            (identical(other.isBaby, isBaby) || other.isBaby == isBaby) &&
            (identical(other.isLegendary, isLegendary) ||
                other.isLegendary == isLegendary) &&
            (identical(other.isMythical, isMythical) ||
                other.isMythical == isMythical) &&
            (identical(other.evolutionId, evolutionId) ||
                other.evolutionId == evolutionId) &&
            const DeepCollectionEquality()
                .equals(other._pokemonEvolutions, _pokemonEvolutions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        order,
        height,
        weight,
        baseExperience,
        baseStat,
        baseAttack,
        baseDefense,
        baseSpecialAttack,
        baseSpecialDefense,
        baseSpeed,
        isDefault,
        svgUrl,
        const DeepCollectionEquality().hash(_types),
        baseHappiness,
        captureRate,
        isBaby,
        isLegendary,
        isMythical,
        evolutionId,
        const DeepCollectionEquality().hash(_pokemonEvolutions)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonModelImplCopyWith<_$PokemonModelImpl> get copyWith =>
      __$$PokemonModelImplCopyWithImpl<_$PokemonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonModel implements PokemonModel {
  const factory _PokemonModel(
      {final int? id,
      final String? name,
      final int? order,
      final int? height,
      final int? weight,
      @JsonKey(name: 'base_experience') final int? baseExperience,
      @JsonKey(name: 'base_hp') final int? baseStat,
      @JsonKey(name: 'base_attack') final int? baseAttack,
      @JsonKey(name: 'base_defense') final int? baseDefense,
      @JsonKey(name: 'base_special_attack') final int? baseSpecialAttack,
      @JsonKey(name: 'base_special_defense') final int? baseSpecialDefense,
      @JsonKey(name: 'base_speed') final int? baseSpeed,
      @JsonKey(name: 'is_default') final bool? isDefault,
      @JsonKey(name: 'svg_url') final String? svgUrl,
      final Set<PokemonTypes>? types,
      @JsonKey(name: 'base_happiness') final int? baseHappiness,
      @JsonKey(name: 'capture_rate') final int? captureRate,
      @JsonKey(name: 'is_baby') final bool? isBaby,
      @JsonKey(name: 'is_legendary') final bool? isLegendary,
      @JsonKey(name: 'is_mythical') final bool? isMythical,
      @JsonKey(name: 'evolution_id') final int? evolutionId,
      @JsonKey(name: 'pokemon_evolutions')
      final Set<PokemonModel>? pokemonEvolutions}) = _$PokemonModelImpl;

  factory _PokemonModel.fromJson(Map<String, dynamic> json) =
      _$PokemonModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get order;
  @override
  int? get height;
  @override
  int? get weight;
  @override
  @JsonKey(name: 'base_experience')
  int? get baseExperience;
  @override
  @JsonKey(name: 'base_hp')
  int? get baseStat;
  @override
  @JsonKey(name: 'base_attack')
  int? get baseAttack;
  @override
  @JsonKey(name: 'base_defense')
  int? get baseDefense;
  @override
  @JsonKey(name: 'base_special_attack')
  int? get baseSpecialAttack;
  @override
  @JsonKey(name: 'base_special_defense')
  int? get baseSpecialDefense;
  @override
  @JsonKey(name: 'base_speed')
  int? get baseSpeed;
  @override
  @JsonKey(name: 'is_default')
  bool? get isDefault;
  @override
  @JsonKey(name: 'svg_url')
  String? get svgUrl;
  @override
  Set<PokemonTypes>? get types;
  @override
  @JsonKey(name: 'base_happiness')
  int? get baseHappiness;
  @override
  @JsonKey(name: 'capture_rate')
  int? get captureRate;
  @override
  @JsonKey(name: 'is_baby')
  bool? get isBaby;
  @override
  @JsonKey(name: 'is_legendary')
  bool? get isLegendary;
  @override
  @JsonKey(name: 'is_mythical')
  bool? get isMythical;
  @override
  @JsonKey(name: 'evolution_id')
  int? get evolutionId;
  @override
  @JsonKey(name: 'pokemon_evolutions')
  Set<PokemonModel>? get pokemonEvolutions;
  @override
  @JsonKey(ignore: true)
  _$$PokemonModelImplCopyWith<_$PokemonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
