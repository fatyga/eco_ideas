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
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'idea_id')
  String get ideaId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  List<EcoIdeaStepAddon> get addons => throw _privateConstructorUsedError;

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
      {int id,
      @JsonKey(name: 'idea_id') String ideaId,
      String title,
      String description,
      @JsonKey(includeToJson: false) List<EcoIdeaStepAddon> addons});
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
    Object? id = null,
    Object? ideaId = null,
    Object? title = null,
    Object? description = null,
    Object? addons = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ideaId: null == ideaId
          ? _value.ideaId
          : ideaId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      addons: null == addons
          ? _value.addons
          : addons // ignore: cast_nullable_to_non_nullable
              as List<EcoIdeaStepAddon>,
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
      {int id,
      @JsonKey(name: 'idea_id') String ideaId,
      String title,
      String description,
      @JsonKey(includeToJson: false) List<EcoIdeaStepAddon> addons});
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
    Object? id = null,
    Object? ideaId = null,
    Object? title = null,
    Object? description = null,
    Object? addons = null,
  }) {
    return _then(_$EcoIdeaStepImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ideaId: null == ideaId
          ? _value.ideaId
          : ideaId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      addons: null == addons
          ? _value._addons
          : addons // ignore: cast_nullable_to_non_nullable
              as List<EcoIdeaStepAddon>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EcoIdeaStepImpl implements _EcoIdeaStep {
  const _$EcoIdeaStepImpl(
      {required this.id,
      @JsonKey(name: 'idea_id') required this.ideaId,
      this.title = '',
      this.description = '',
      @JsonKey(includeToJson: false)
      final List<EcoIdeaStepAddon> addons = const []})
      : _addons = addons;

  factory _$EcoIdeaStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$EcoIdeaStepImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'idea_id')
  final String ideaId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  final List<EcoIdeaStepAddon> _addons;
  @override
  @JsonKey(includeToJson: false)
  List<EcoIdeaStepAddon> get addons {
    if (_addons is EqualUnmodifiableListView) return _addons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addons);
  }

  @override
  String toString() {
    return 'EcoIdeaStep(id: $id, ideaId: $ideaId, title: $title, description: $description, addons: $addons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcoIdeaStepImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ideaId, ideaId) || other.ideaId == ideaId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._addons, _addons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, ideaId, title, description,
      const DeepCollectionEquality().hash(_addons));

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
          {required final int id,
          @JsonKey(name: 'idea_id') required final String ideaId,
          final String title,
          final String description,
          @JsonKey(includeToJson: false) final List<EcoIdeaStepAddon> addons}) =
      _$EcoIdeaStepImpl;

  factory _EcoIdeaStep.fromJson(Map<String, dynamic> json) =
      _$EcoIdeaStepImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'idea_id')
  String get ideaId;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(includeToJson: false)
  List<EcoIdeaStepAddon> get addons;

  /// Create a copy of EcoIdeaStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcoIdeaStepImplCopyWith<_$EcoIdeaStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
