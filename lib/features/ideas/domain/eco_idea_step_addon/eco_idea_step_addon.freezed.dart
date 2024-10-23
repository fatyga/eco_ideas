// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eco_idea_step_addon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EcoIdeaStepAddon _$EcoIdeaStepAddonFromJson(Map<String, dynamic> json) {
  return _EcoIdeaStep.fromJson(json);
}

/// @nodoc
mixin _$EcoIdeaStepAddon {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  IdeaStepAddonType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'step_id')
  int get stepId => throw _privateConstructorUsedError;
  @JsonKey(name: 'idea_id')
  String get ideaId => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Serializes this EcoIdeaStepAddon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EcoIdeaStepAddon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EcoIdeaStepAddonCopyWith<EcoIdeaStepAddon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EcoIdeaStepAddonCopyWith<$Res> {
  factory $EcoIdeaStepAddonCopyWith(
          EcoIdeaStepAddon value, $Res Function(EcoIdeaStepAddon) then) =
      _$EcoIdeaStepAddonCopyWithImpl<$Res, EcoIdeaStepAddon>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'type') IdeaStepAddonType type,
      @JsonKey(name: 'step_id') int stepId,
      @JsonKey(name: 'idea_id') String ideaId,
      String value});
}

/// @nodoc
class _$EcoIdeaStepAddonCopyWithImpl<$Res, $Val extends EcoIdeaStepAddon>
    implements $EcoIdeaStepAddonCopyWith<$Res> {
  _$EcoIdeaStepAddonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EcoIdeaStepAddon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? stepId = null,
    Object? ideaId = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IdeaStepAddonType,
      stepId: null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      ideaId: null == ideaId
          ? _value.ideaId
          : ideaId // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EcoIdeaStepImplCopyWith<$Res>
    implements $EcoIdeaStepAddonCopyWith<$Res> {
  factory _$$EcoIdeaStepImplCopyWith(
          _$EcoIdeaStepImpl value, $Res Function(_$EcoIdeaStepImpl) then) =
      __$$EcoIdeaStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'type') IdeaStepAddonType type,
      @JsonKey(name: 'step_id') int stepId,
      @JsonKey(name: 'idea_id') String ideaId,
      String value});
}

/// @nodoc
class __$$EcoIdeaStepImplCopyWithImpl<$Res>
    extends _$EcoIdeaStepAddonCopyWithImpl<$Res, _$EcoIdeaStepImpl>
    implements _$$EcoIdeaStepImplCopyWith<$Res> {
  __$$EcoIdeaStepImplCopyWithImpl(
      _$EcoIdeaStepImpl _value, $Res Function(_$EcoIdeaStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of EcoIdeaStepAddon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? stepId = null,
    Object? ideaId = null,
    Object? value = null,
  }) {
    return _then(_$EcoIdeaStepImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IdeaStepAddonType,
      stepId: null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as int,
      ideaId: null == ideaId
          ? _value.ideaId
          : ideaId // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EcoIdeaStepImpl extends _EcoIdeaStep {
  const _$EcoIdeaStepImpl(
      {required this.id,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'step_id') required this.stepId,
      @JsonKey(name: 'idea_id') required this.ideaId,
      required this.value})
      : super._();

  factory _$EcoIdeaStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$EcoIdeaStepImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'type')
  final IdeaStepAddonType type;
  @override
  @JsonKey(name: 'step_id')
  final int stepId;
  @override
  @JsonKey(name: 'idea_id')
  final String ideaId;
  @override
  final String value;

  @override
  String toString() {
    return 'EcoIdeaStepAddon(id: $id, type: $type, stepId: $stepId, ideaId: $ideaId, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcoIdeaStepImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.ideaId, ideaId) || other.ideaId == ideaId) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, stepId, ideaId, value);

  /// Create a copy of EcoIdeaStepAddon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EcoIdeaStepImplCopyWith<_$EcoIdeaStepImpl> get copyWith =>
      __$$EcoIdeaStepImplCopyWithImpl<_$EcoIdeaStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EcoIdeaStepImplToJson(
      this,
    );
  }
}

abstract class _EcoIdeaStep extends EcoIdeaStepAddon {
  const factory _EcoIdeaStep(
      {required final int id,
      @JsonKey(name: 'type') required final IdeaStepAddonType type,
      @JsonKey(name: 'step_id') required final int stepId,
      @JsonKey(name: 'idea_id') required final String ideaId,
      required final String value}) = _$EcoIdeaStepImpl;
  const _EcoIdeaStep._() : super._();

  factory _EcoIdeaStep.fromJson(Map<String, dynamic> json) =
      _$EcoIdeaStepImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'type')
  IdeaStepAddonType get type;
  @override
  @JsonKey(name: 'step_id')
  int get stepId;
  @override
  @JsonKey(name: 'idea_id')
  String get ideaId;
  @override
  String get value;

  /// Create a copy of EcoIdeaStepAddon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcoIdeaStepImplCopyWith<_$EcoIdeaStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
