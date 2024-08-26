// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eco_idea_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EcoIdeaStep _$EcoIdeaStepFromJson(Map<String, dynamic> json) {
  return _EcoIdeaStep.fromJson(json);
}

/// @nodoc
mixin _$EcoIdeaStep {
  String get image => throw _privateConstructorUsedError;
  EcoIdeaStepType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this EcoIdeaStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EcoIdeaStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EcoIdeaStepCopyWith<EcoIdeaStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EcoIdeaStepCopyWith<$Res> {
  factory $EcoIdeaStepCopyWith(
          EcoIdeaStep value, $Res Function(EcoIdeaStep) then) =
      _$EcoIdeaStepCopyWithImpl<$Res, EcoIdeaStep>;
  @useResult
  $Res call(
      {String image, EcoIdeaStepType type, String title, String description});
}

/// @nodoc
class _$EcoIdeaStepCopyWithImpl<$Res, $Val extends EcoIdeaStep>
    implements $EcoIdeaStepCopyWith<$Res> {
  _$EcoIdeaStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EcoIdeaStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EcoIdeaStepType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EcoIdeaStepImplCopyWith<$Res>
    implements $EcoIdeaStepCopyWith<$Res> {
  factory _$$EcoIdeaStepImplCopyWith(
          _$EcoIdeaStepImpl value, $Res Function(_$EcoIdeaStepImpl) then) =
      __$$EcoIdeaStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String image, EcoIdeaStepType type, String title, String description});
}

/// @nodoc
class __$$EcoIdeaStepImplCopyWithImpl<$Res>
    extends _$EcoIdeaStepCopyWithImpl<$Res, _$EcoIdeaStepImpl>
    implements _$$EcoIdeaStepImplCopyWith<$Res> {
  __$$EcoIdeaStepImplCopyWithImpl(
      _$EcoIdeaStepImpl _value, $Res Function(_$EcoIdeaStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of EcoIdeaStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$EcoIdeaStepImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EcoIdeaStepType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EcoIdeaStepImpl implements _EcoIdeaStep {
  const _$EcoIdeaStepImpl(
      {this.image = '',
      this.type = EcoIdeaStepType.introduction,
      this.title = '',
      this.description = ''});

  factory _$EcoIdeaStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$EcoIdeaStepImplFromJson(json);

  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final EcoIdeaStepType type;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'EcoIdeaStep(image: $image, type: $type, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcoIdeaStepImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, image, type, title, description);

  /// Create a copy of EcoIdeaStep
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

abstract class _EcoIdeaStep implements EcoIdeaStep {
  const factory _EcoIdeaStep(
      {final String image,
      final EcoIdeaStepType type,
      final String title,
      final String description}) = _$EcoIdeaStepImpl;

  factory _EcoIdeaStep.fromJson(Map<String, dynamic> json) =
      _$EcoIdeaStepImpl.fromJson;

  @override
  String get image;
  @override
  EcoIdeaStepType get type;
  @override
  String get title;
  @override
  String get description;

  /// Create a copy of EcoIdeaStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcoIdeaStepImplCopyWith<_$EcoIdeaStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
