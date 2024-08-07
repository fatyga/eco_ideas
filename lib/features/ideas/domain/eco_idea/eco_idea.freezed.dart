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
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String>? get requirments => throw _privateConstructorUsedError;
  List<String>? get benefits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      String title,
      String description,
      List<String>? requirments,
      List<String>? benefits});
}

/// @nodoc
class _$EcoIdeaCopyWithImpl<$Res, $Val extends EcoIdea>
    implements $EcoIdeaCopyWith<$Res> {
  _$EcoIdeaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? requirments = freezed,
    Object? benefits = freezed,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      requirments: freezed == requirments
          ? _value.requirments
          : requirments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      benefits: freezed == benefits
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      String title,
      String description,
      List<String>? requirments,
      List<String>? benefits});
}

/// @nodoc
class __$$EcoIdeaImplCopyWithImpl<$Res>
    extends _$EcoIdeaCopyWithImpl<$Res, _$EcoIdeaImpl>
    implements _$$EcoIdeaImplCopyWith<$Res> {
  __$$EcoIdeaImplCopyWithImpl(
      _$EcoIdeaImpl _value, $Res Function(_$EcoIdeaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? requirments = freezed,
    Object? benefits = freezed,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      requirments: freezed == requirments
          ? _value._requirments
          : requirments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      benefits: freezed == benefits
          ? _value._benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EcoIdeaImpl implements _EcoIdea {
  const _$EcoIdeaImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.title,
      required this.description,
      final List<String>? requirments,
      final List<String>? benefits})
      : _requirments = requirments,
        _benefits = benefits;

  factory _$EcoIdeaImpl.fromJson(Map<String, dynamic> json) =>
      _$$EcoIdeaImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String title;
  @override
  final String description;
  final List<String>? _requirments;
  @override
  List<String>? get requirments {
    final value = _requirments;
    if (value == null) return null;
    if (_requirments is EqualUnmodifiableListView) return _requirments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _benefits;
  @override
  List<String>? get benefits {
    final value = _benefits;
    if (value == null) return null;
    if (_benefits is EqualUnmodifiableListView) return _benefits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EcoIdea(id: $id, userId: $userId, title: $title, description: $description, requirments: $requirments, benefits: $benefits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcoIdeaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._requirments, _requirments) &&
            const DeepCollectionEquality().equals(other._benefits, _benefits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      description,
      const DeepCollectionEquality().hash(_requirments),
      const DeepCollectionEquality().hash(_benefits));

  @JsonKey(ignore: true)
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
      required final String title,
      required final String description,
      final List<String>? requirments,
      final List<String>? benefits}) = _$EcoIdeaImpl;

  factory _EcoIdea.fromJson(Map<String, dynamic> json) = _$EcoIdeaImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get title;
  @override
  String get description;
  @override
  List<String>? get requirments;
  @override
  List<String>? get benefits;
  @override
  @JsonKey(ignore: true)
  _$$EcoIdeaImplCopyWith<_$EcoIdeaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
