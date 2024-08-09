// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eco_idea.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EcoIdea _$EcoIdeaFromJson(Map<String, dynamic> json) {
  return _EcoIdea.fromJson(json);
}

/// @nodoc
mixin _$EcoIdea {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_draft')
  bool get isDraft => throw _privateConstructorUsedError;
  List<EcoIdeaStep> get steps => throw _privateConstructorUsedError;

  /// Serializes this EcoIdea to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EcoIdea
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EcoIdeaCopyWith<EcoIdea> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EcoIdeaCopyWith<$Res> {
  factory $EcoIdeaCopyWith(EcoIdea value, $Res Function(EcoIdea) then) =
      _$EcoIdeaCopyWithImpl<$Res, EcoIdea>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'is_draft') bool isDraft,
      List<EcoIdeaStep> steps});
}

/// @nodoc
class _$EcoIdeaCopyWithImpl<$Res, $Val extends EcoIdea>
    implements $EcoIdeaCopyWith<$Res> {
  _$EcoIdeaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EcoIdea
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? isDraft = null,
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<EcoIdeaStep>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EcoIdeaImplCopyWith<$Res> implements $EcoIdeaCopyWith<$Res> {
  factory _$$EcoIdeaImplCopyWith(
          _$EcoIdeaImpl value, $Res Function(_$EcoIdeaImpl) then) =
      __$$EcoIdeaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'is_draft') bool isDraft,
      List<EcoIdeaStep> steps});
}

/// @nodoc
class __$$EcoIdeaImplCopyWithImpl<$Res>
    extends _$EcoIdeaCopyWithImpl<$Res, _$EcoIdeaImpl>
    implements _$$EcoIdeaImplCopyWith<$Res> {
  __$$EcoIdeaImplCopyWithImpl(
      _$EcoIdeaImpl _value, $Res Function(_$EcoIdeaImpl) _then)
      : super(_value, _then);

  /// Create a copy of EcoIdea
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? isDraft = null,
    Object? steps = null,
  }) {
    return _then(_$EcoIdeaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<EcoIdeaStep>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EcoIdeaImpl implements _EcoIdea {
  const _$EcoIdeaImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'is_draft') required this.isDraft,
      required final List<EcoIdeaStep> steps})
      : _steps = steps;

  factory _$EcoIdeaImpl.fromJson(Map<String, dynamic> json) =>
      _$$EcoIdeaImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'is_draft')
  final bool isDraft;
  final List<EcoIdeaStep> _steps;
  @override
  List<EcoIdeaStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'EcoIdea(id: $id, userId: $userId, isDraft: $isDraft, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcoIdeaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isDraft, isDraft) || other.isDraft == isDraft) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, isDraft,
      const DeepCollectionEquality().hash(_steps));

  /// Create a copy of EcoIdea
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EcoIdeaImplCopyWith<_$EcoIdeaImpl> get copyWith =>
      __$$EcoIdeaImplCopyWithImpl<_$EcoIdeaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EcoIdeaImplToJson(
      this,
    );
  }
}

abstract class _EcoIdea implements EcoIdea {
  const factory _EcoIdea(
      {required final String id,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'is_draft') required final bool isDraft,
      required final List<EcoIdeaStep> steps}) = _$EcoIdeaImpl;

  factory _EcoIdea.fromJson(Map<String, dynamic> json) = _$EcoIdeaImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'is_draft')
  bool get isDraft;
  @override
  List<EcoIdeaStep> get steps;

  /// Create a copy of EcoIdea
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcoIdeaImplCopyWith<_$EcoIdeaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
