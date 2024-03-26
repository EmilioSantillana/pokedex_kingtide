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
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'order')
  int? get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender_rate')
  int? get genderRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'capture_rate')
  int? get captureRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_happiness')
  int? get baseHappiness => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_baby')
  bool? get isBaby => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_legendary')
  bool? get isLegendary => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_mythical')
  bool? get isMythical => throw _privateConstructorUsedError;
  @JsonKey(name: 'hatch_counter')
  int? get hatchCounter => throw _privateConstructorUsedError;
  @JsonKey(name: 'svg_url')
  String? get svgUrl => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'order') int? order,
      @JsonKey(name: 'gender_rate') int? genderRate,
      @JsonKey(name: 'capture_rate') int? captureRate,
      @JsonKey(name: 'base_happiness') int? baseHappiness,
      @JsonKey(name: 'is_baby') bool? isBaby,
      @JsonKey(name: 'is_legendary') bool? isLegendary,
      @JsonKey(name: 'is_mythical') bool? isMythical,
      @JsonKey(name: 'hatch_counter') int? hatchCounter,
      @JsonKey(name: 'svg_url') String? svgUrl});
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
    Object? genderRate = freezed,
    Object? captureRate = freezed,
    Object? baseHappiness = freezed,
    Object? isBaby = freezed,
    Object? isLegendary = freezed,
    Object? isMythical = freezed,
    Object? hatchCounter = freezed,
    Object? svgUrl = freezed,
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
      genderRate: freezed == genderRate
          ? _value.genderRate
          : genderRate // ignore: cast_nullable_to_non_nullable
              as int?,
      captureRate: freezed == captureRate
          ? _value.captureRate
          : captureRate // ignore: cast_nullable_to_non_nullable
              as int?,
      baseHappiness: freezed == baseHappiness
          ? _value.baseHappiness
          : baseHappiness // ignore: cast_nullable_to_non_nullable
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
      hatchCounter: freezed == hatchCounter
          ? _value.hatchCounter
          : hatchCounter // ignore: cast_nullable_to_non_nullable
              as int?,
      svgUrl: freezed == svgUrl
          ? _value.svgUrl
          : svgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'order') int? order,
      @JsonKey(name: 'gender_rate') int? genderRate,
      @JsonKey(name: 'capture_rate') int? captureRate,
      @JsonKey(name: 'base_happiness') int? baseHappiness,
      @JsonKey(name: 'is_baby') bool? isBaby,
      @JsonKey(name: 'is_legendary') bool? isLegendary,
      @JsonKey(name: 'is_mythical') bool? isMythical,
      @JsonKey(name: 'hatch_counter') int? hatchCounter,
      @JsonKey(name: 'svg_url') String? svgUrl});
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
    Object? genderRate = freezed,
    Object? captureRate = freezed,
    Object? baseHappiness = freezed,
    Object? isBaby = freezed,
    Object? isLegendary = freezed,
    Object? isMythical = freezed,
    Object? hatchCounter = freezed,
    Object? svgUrl = freezed,
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
      genderRate: freezed == genderRate
          ? _value.genderRate
          : genderRate // ignore: cast_nullable_to_non_nullable
              as int?,
      captureRate: freezed == captureRate
          ? _value.captureRate
          : captureRate // ignore: cast_nullable_to_non_nullable
              as int?,
      baseHappiness: freezed == baseHappiness
          ? _value.baseHappiness
          : baseHappiness // ignore: cast_nullable_to_non_nullable
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
      hatchCounter: freezed == hatchCounter
          ? _value.hatchCounter
          : hatchCounter // ignore: cast_nullable_to_non_nullable
              as int?,
      svgUrl: freezed == svgUrl
          ? _value.svgUrl
          : svgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonModelImpl implements _PokemonModel {
  const _$PokemonModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'order') this.order,
      @JsonKey(name: 'gender_rate') this.genderRate,
      @JsonKey(name: 'capture_rate') this.captureRate,
      @JsonKey(name: 'base_happiness') this.baseHappiness,
      @JsonKey(name: 'is_baby') this.isBaby,
      @JsonKey(name: 'is_legendary') this.isLegendary,
      @JsonKey(name: 'is_mythical') this.isMythical,
      @JsonKey(name: 'hatch_counter') this.hatchCounter,
      @JsonKey(name: 'svg_url') this.svgUrl});

  factory _$PokemonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'order')
  final int? order;
  @override
  @JsonKey(name: 'gender_rate')
  final int? genderRate;
  @override
  @JsonKey(name: 'capture_rate')
  final int? captureRate;
  @override
  @JsonKey(name: 'base_happiness')
  final int? baseHappiness;
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
  @JsonKey(name: 'hatch_counter')
  final int? hatchCounter;
  @override
  @JsonKey(name: 'svg_url')
  final String? svgUrl;

  @override
  String toString() {
    return 'PokemonModel(id: $id, name: $name, order: $order, genderRate: $genderRate, captureRate: $captureRate, baseHappiness: $baseHappiness, isBaby: $isBaby, isLegendary: $isLegendary, isMythical: $isMythical, hatchCounter: $hatchCounter, svgUrl: $svgUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.genderRate, genderRate) ||
                other.genderRate == genderRate) &&
            (identical(other.captureRate, captureRate) ||
                other.captureRate == captureRate) &&
            (identical(other.baseHappiness, baseHappiness) ||
                other.baseHappiness == baseHappiness) &&
            (identical(other.isBaby, isBaby) || other.isBaby == isBaby) &&
            (identical(other.isLegendary, isLegendary) ||
                other.isLegendary == isLegendary) &&
            (identical(other.isMythical, isMythical) ||
                other.isMythical == isMythical) &&
            (identical(other.hatchCounter, hatchCounter) ||
                other.hatchCounter == hatchCounter) &&
            (identical(other.svgUrl, svgUrl) || other.svgUrl == svgUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      order,
      genderRate,
      captureRate,
      baseHappiness,
      isBaby,
      isLegendary,
      isMythical,
      hatchCounter,
      svgUrl);

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
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'order') final int? order,
      @JsonKey(name: 'gender_rate') final int? genderRate,
      @JsonKey(name: 'capture_rate') final int? captureRate,
      @JsonKey(name: 'base_happiness') final int? baseHappiness,
      @JsonKey(name: 'is_baby') final bool? isBaby,
      @JsonKey(name: 'is_legendary') final bool? isLegendary,
      @JsonKey(name: 'is_mythical') final bool? isMythical,
      @JsonKey(name: 'hatch_counter') final int? hatchCounter,
      @JsonKey(name: 'svg_url') final String? svgUrl}) = _$PokemonModelImpl;

  factory _PokemonModel.fromJson(Map<String, dynamic> json) =
      _$PokemonModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'order')
  int? get order;
  @override
  @JsonKey(name: 'gender_rate')
  int? get genderRate;
  @override
  @JsonKey(name: 'capture_rate')
  int? get captureRate;
  @override
  @JsonKey(name: 'base_happiness')
  int? get baseHappiness;
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
  @JsonKey(name: 'hatch_counter')
  int? get hatchCounter;
  @override
  @JsonKey(name: 'svg_url')
  String? get svgUrl;
  @override
  @JsonKey(ignore: true)
  _$$PokemonModelImplCopyWith<_$PokemonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
