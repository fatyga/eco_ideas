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
  @JsonKey(name: 'profile_id')
  String get profileId => throw _privateConstructorUsedError;
  List<EcoIdeaStep> get steps => throw _privateConstructorUsedError;
  bool get published => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'profile_id') String profileId,
      List<EcoIdeaStep> steps,
      bool published});
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
    Object? profileId = null,
    Object? steps = null,
    Object? published = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<EcoIdeaStep>,
      published: null == published
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as bool,
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
      @JsonKey(name: 'profile_id') String profileId,
      List<EcoIdeaStep> steps,
      bool published});
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
    Object? profileId = null,
    Object? steps = null,
    Object? published = null,
  }) {
    return _then(_$EcoIdeaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<EcoIdeaStep>,
      published: null == published
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EcoIdeaImpl implements _EcoIdea {
  const _$EcoIdeaImpl(
      {required this.id,
      @JsonKey(name: 'profile_id') required this.profileId,
      required final List<EcoIdeaStep> steps,
      required this.published})
      : _steps = steps;

  factory _$EcoIdeaImpl.fromJson(Map<String, dynamic> json) =>
      _$$EcoIdeaImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'profile_id')
  final String profileId;
  final List<EcoIdeaStep> _steps;
  @override
  List<EcoIdeaStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final bool published;

  @override
  String toString() {
    return 'EcoIdea(id: $id, profileId: $profileId, steps: $steps, published: $published)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcoIdeaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.published, published) ||
                other.published == published));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, profileId,
      const DeepCollectionEquality().hash(_steps), published);

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
      @JsonKey(name: 'profile_id') required final String profileId,
      required final List<EcoIdeaStep> steps,
      required final bool published}) = _$EcoIdeaImpl;

  factory _EcoIdea.fromJson(Map<String, dynamic> json) = _$EcoIdeaImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'profile_id')
  String get profileId;
  @override
  List<EcoIdeaStep> get steps;
  @override
  bool get published;

  /// Create a copy of EcoIdea
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcoIdeaImplCopyWith<_$EcoIdeaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
