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

/// @nodoc
mixin _$EcoIdeaStep {
  String get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get notes => throw _privateConstructorUsedError;
  List<String> get tips => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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
      {String image, String title, List<String> notes, List<String> tips});
}

/// @nodoc
class _$EcoIdeaStepCopyWithImpl<$Res, $Val extends EcoIdeaStep>
    implements $EcoIdeaStepCopyWith<$Res> {
  _$EcoIdeaStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? title = null,
    Object? notes = null,
    Object? tips = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tips: null == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      {String image, String title, List<String> notes, List<String> tips});
}

/// @nodoc
class __$$EcoIdeaStepImplCopyWithImpl<$Res>
    extends _$EcoIdeaStepCopyWithImpl<$Res, _$EcoIdeaStepImpl>
    implements _$$EcoIdeaStepImplCopyWith<$Res> {
  __$$EcoIdeaStepImplCopyWithImpl(
      _$EcoIdeaStepImpl _value, $Res Function(_$EcoIdeaStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? title = null,
    Object? notes = null,
    Object? tips = null,
  }) {
    return _then(_$EcoIdeaStepImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tips: null == tips
          ? _value._tips
          : tips // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$EcoIdeaStepImpl implements _EcoIdeaStep {
  const _$EcoIdeaStepImpl(
      {required this.image,
      required this.title,
      final List<String> notes = const [],
      final List<String> tips = const []})
      : _notes = notes,
        _tips = tips;

  @override
  final String image;
  @override
  final String title;
  final List<String> _notes;
  @override
  @JsonKey()
  List<String> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  final List<String> _tips;
  @override
  @JsonKey()
  List<String> get tips {
    if (_tips is EqualUnmodifiableListView) return _tips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tips);
  }

  @override
  String toString() {
    return 'EcoIdeaStep(image: $image, title: $title, notes: $notes, tips: $tips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcoIdeaStepImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            const DeepCollectionEquality().equals(other._tips, _tips));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      image,
      title,
      const DeepCollectionEquality().hash(_notes),
      const DeepCollectionEquality().hash(_tips));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EcoIdeaStepImplCopyWith<_$EcoIdeaStepImpl> get copyWith =>
      __$$EcoIdeaStepImplCopyWithImpl<_$EcoIdeaStepImpl>(this, _$identity);
}

abstract class _EcoIdeaStep implements EcoIdeaStep {
  const factory _EcoIdeaStep(
      {required final String image,
      required final String title,
      final List<String> notes,
      final List<String> tips}) = _$EcoIdeaStepImpl;

  @override
  String get image;
  @override
  String get title;
  @override
  List<String> get notes;
  @override
  List<String> get tips;
  @override
  @JsonKey(ignore: true)
  _$$EcoIdeaStepImplCopyWith<_$EcoIdeaStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
