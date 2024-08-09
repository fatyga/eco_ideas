// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modify_my_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ModifyMyProfileState {
  AvatarInput get avatarInput => throw _privateConstructorUsedError;
  AboutMeInput get aboutMeInput => throw _privateConstructorUsedError;

  /// Create a copy of ModifyMyProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModifyMyProfileStateCopyWith<ModifyMyProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifyMyProfileStateCopyWith<$Res> {
  factory $ModifyMyProfileStateCopyWith(ModifyMyProfileState value,
          $Res Function(ModifyMyProfileState) then) =
      _$ModifyMyProfileStateCopyWithImpl<$Res, ModifyMyProfileState>;
  @useResult
  $Res call({AvatarInput avatarInput, AboutMeInput aboutMeInput});
}

/// @nodoc
class _$ModifyMyProfileStateCopyWithImpl<$Res,
        $Val extends ModifyMyProfileState>
    implements $ModifyMyProfileStateCopyWith<$Res> {
  _$ModifyMyProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModifyMyProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarInput = null,
    Object? aboutMeInput = null,
  }) {
    return _then(_value.copyWith(
      avatarInput: null == avatarInput
          ? _value.avatarInput
          : avatarInput // ignore: cast_nullable_to_non_nullable
              as AvatarInput,
      aboutMeInput: null == aboutMeInput
          ? _value.aboutMeInput
          : aboutMeInput // ignore: cast_nullable_to_non_nullable
              as AboutMeInput,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModifyMyProfileStateImplCopyWith<$Res>
    implements $ModifyMyProfileStateCopyWith<$Res> {
  factory _$$ModifyMyProfileStateImplCopyWith(_$ModifyMyProfileStateImpl value,
          $Res Function(_$ModifyMyProfileStateImpl) then) =
      __$$ModifyMyProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AvatarInput avatarInput, AboutMeInput aboutMeInput});
}

/// @nodoc
class __$$ModifyMyProfileStateImplCopyWithImpl<$Res>
    extends _$ModifyMyProfileStateCopyWithImpl<$Res, _$ModifyMyProfileStateImpl>
    implements _$$ModifyMyProfileStateImplCopyWith<$Res> {
  __$$ModifyMyProfileStateImplCopyWithImpl(_$ModifyMyProfileStateImpl _value,
      $Res Function(_$ModifyMyProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModifyMyProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarInput = null,
    Object? aboutMeInput = null,
  }) {
    return _then(_$ModifyMyProfileStateImpl(
      avatarInput: null == avatarInput
          ? _value.avatarInput
          : avatarInput // ignore: cast_nullable_to_non_nullable
              as AvatarInput,
      aboutMeInput: null == aboutMeInput
          ? _value.aboutMeInput
          : aboutMeInput // ignore: cast_nullable_to_non_nullable
              as AboutMeInput,
    ));
  }
}

/// @nodoc

class _$ModifyMyProfileStateImpl implements _ModifyMyProfileState {
  const _$ModifyMyProfileStateImpl(
      {this.avatarInput = const AvatarInput.pure(),
      this.aboutMeInput = const AboutMeInput.pure()});

  @override
  @JsonKey()
  final AvatarInput avatarInput;
  @override
  @JsonKey()
  final AboutMeInput aboutMeInput;

  @override
  String toString() {
    return 'ModifyMyProfileState(avatarInput: $avatarInput, aboutMeInput: $aboutMeInput)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyMyProfileStateImpl &&
            (identical(other.avatarInput, avatarInput) ||
                other.avatarInput == avatarInput) &&
            (identical(other.aboutMeInput, aboutMeInput) ||
                other.aboutMeInput == aboutMeInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, avatarInput, aboutMeInput);

  /// Create a copy of ModifyMyProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyMyProfileStateImplCopyWith<_$ModifyMyProfileStateImpl>
      get copyWith =>
          __$$ModifyMyProfileStateImplCopyWithImpl<_$ModifyMyProfileStateImpl>(
              this, _$identity);
}

abstract class _ModifyMyProfileState implements ModifyMyProfileState {
  const factory _ModifyMyProfileState(
      {final AvatarInput avatarInput,
      final AboutMeInput aboutMeInput}) = _$ModifyMyProfileStateImpl;

  @override
  AvatarInput get avatarInput;
  @override
  AboutMeInput get aboutMeInput;

  /// Create a copy of ModifyMyProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModifyMyProfileStateImplCopyWith<_$ModifyMyProfileStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
