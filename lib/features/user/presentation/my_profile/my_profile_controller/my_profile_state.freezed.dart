// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyProfileState {
  UserProfile get userProfile => throw _privateConstructorUsedError;
  UserAvatar? get userAvatar => throw _privateConstructorUsedError;

  /// Create a copy of MyProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyProfileStateCopyWith<MyProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyProfileStateCopyWith<$Res> {
  factory $MyProfileStateCopyWith(
          MyProfileState value, $Res Function(MyProfileState) then) =
      _$MyProfileStateCopyWithImpl<$Res, MyProfileState>;
  @useResult
  $Res call({UserProfile userProfile, UserAvatar? userAvatar});

  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class _$MyProfileStateCopyWithImpl<$Res, $Val extends MyProfileState>
    implements $MyProfileStateCopyWith<$Res> {
  _$MyProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
    Object? userAvatar = freezed,
  }) {
    return _then(_value.copyWith(
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      userAvatar: freezed == userAvatar
          ? _value.userAvatar
          : userAvatar // ignore: cast_nullable_to_non_nullable
              as UserAvatar?,
    ) as $Val);
  }

  /// Create a copy of MyProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get userProfile {
    return $UserProfileCopyWith<$Res>(_value.userProfile, (value) {
      return _then(_value.copyWith(userProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyProfileStateImplCopyWith<$Res>
    implements $MyProfileStateCopyWith<$Res> {
  factory _$$MyProfileStateImplCopyWith(_$MyProfileStateImpl value,
          $Res Function(_$MyProfileStateImpl) then) =
      __$$MyProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserProfile userProfile, UserAvatar? userAvatar});

  @override
  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class __$$MyProfileStateImplCopyWithImpl<$Res>
    extends _$MyProfileStateCopyWithImpl<$Res, _$MyProfileStateImpl>
    implements _$$MyProfileStateImplCopyWith<$Res> {
  __$$MyProfileStateImplCopyWithImpl(
      _$MyProfileStateImpl _value, $Res Function(_$MyProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
    Object? userAvatar = freezed,
  }) {
    return _then(_$MyProfileStateImpl(
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      userAvatar: freezed == userAvatar
          ? _value.userAvatar
          : userAvatar // ignore: cast_nullable_to_non_nullable
              as UserAvatar?,
    ));
  }
}

/// @nodoc

class _$MyProfileStateImpl implements _MyProfileState {
  const _$MyProfileStateImpl({required this.userProfile, this.userAvatar});

  @override
  final UserProfile userProfile;
  @override
  final UserAvatar? userAvatar;

  @override
  String toString() {
    return 'MyProfileState(userProfile: $userProfile, userAvatar: $userAvatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyProfileStateImpl &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.userAvatar, userAvatar) ||
                other.userAvatar == userAvatar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userProfile, userAvatar);

  /// Create a copy of MyProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyProfileStateImplCopyWith<_$MyProfileStateImpl> get copyWith =>
      __$$MyProfileStateImplCopyWithImpl<_$MyProfileStateImpl>(
          this, _$identity);
}

abstract class _MyProfileState implements MyProfileState {
  const factory _MyProfileState(
      {required final UserProfile userProfile,
      final UserAvatar? userAvatar}) = _$MyProfileStateImpl;

  @override
  UserProfile get userProfile;
  @override
  UserAvatar? get userAvatar;

  /// Create a copy of MyProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyProfileStateImplCopyWith<_$MyProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
