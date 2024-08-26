// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'idea_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IdeaEditorState {
  EcoIdea get idea => throw _privateConstructorUsedError;
  int get currentStep => throw _privateConstructorUsedError;

  /// Create a copy of IdeaEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IdeaEditorStateCopyWith<IdeaEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeaEditorStateCopyWith<$Res> {
  factory $IdeaEditorStateCopyWith(
          IdeaEditorState value, $Res Function(IdeaEditorState) then) =
      _$IdeaEditorStateCopyWithImpl<$Res, IdeaEditorState>;
  @useResult
  $Res call({EcoIdea idea, int currentStep});

  $EcoIdeaCopyWith<$Res> get idea;
}

/// @nodoc
class _$IdeaEditorStateCopyWithImpl<$Res, $Val extends IdeaEditorState>
    implements $IdeaEditorStateCopyWith<$Res> {
  _$IdeaEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IdeaEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idea = null,
    Object? currentStep = null,
  }) {
    return _then(_value.copyWith(
      idea: null == idea
          ? _value.idea
          : idea // ignore: cast_nullable_to_non_nullable
              as EcoIdea,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of IdeaEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EcoIdeaCopyWith<$Res> get idea {
    return $EcoIdeaCopyWith<$Res>(_value.idea, (value) {
      return _then(_value.copyWith(idea: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IdeaEditorStateImplCopyWith<$Res>
    implements $IdeaEditorStateCopyWith<$Res> {
  factory _$$IdeaEditorStateImplCopyWith(_$IdeaEditorStateImpl value,
          $Res Function(_$IdeaEditorStateImpl) then) =
      __$$IdeaEditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EcoIdea idea, int currentStep});

  @override
  $EcoIdeaCopyWith<$Res> get idea;
}

/// @nodoc
class __$$IdeaEditorStateImplCopyWithImpl<$Res>
    extends _$IdeaEditorStateCopyWithImpl<$Res, _$IdeaEditorStateImpl>
    implements _$$IdeaEditorStateImplCopyWith<$Res> {
  __$$IdeaEditorStateImplCopyWithImpl(
      _$IdeaEditorStateImpl _value, $Res Function(_$IdeaEditorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of IdeaEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idea = null,
    Object? currentStep = null,
  }) {
    return _then(_$IdeaEditorStateImpl(
      idea: null == idea
          ? _value.idea
          : idea // ignore: cast_nullable_to_non_nullable
              as EcoIdea,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IdeaEditorStateImpl implements _IdeaEditorState {
  const _$IdeaEditorStateImpl({required this.idea, this.currentStep = 0});

  @override
  final EcoIdea idea;
  @override
  @JsonKey()
  final int currentStep;

  @override
  String toString() {
    return 'IdeaEditorState(idea: $idea, currentStep: $currentStep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdeaEditorStateImpl &&
            (identical(other.idea, idea) || other.idea == idea) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idea, currentStep);

  /// Create a copy of IdeaEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdeaEditorStateImplCopyWith<_$IdeaEditorStateImpl> get copyWith =>
      __$$IdeaEditorStateImplCopyWithImpl<_$IdeaEditorStateImpl>(
          this, _$identity);
}

abstract class _IdeaEditorState implements IdeaEditorState {
  const factory _IdeaEditorState(
      {required final EcoIdea idea,
      final int currentStep}) = _$IdeaEditorStateImpl;

  @override
  EcoIdea get idea;
  @override
  int get currentStep;

  /// Create a copy of IdeaEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdeaEditorStateImplCopyWith<_$IdeaEditorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
