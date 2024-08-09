// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PasswordResetSecondStepState {
  RestrictedPasswordInput get passwordInput =>
      throw _privateConstructorUsedError;
  PasswordRetypeInput get passwordRetypeInput =>
      throw _privateConstructorUsedError;

  /// Create a copy of PasswordResetSecondStepState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordResetSecondStepStateCopyWith<PasswordResetSecondStepState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetSecondStepStateCopyWith<$Res> {
  factory $PasswordResetSecondStepStateCopyWith(
          PasswordResetSecondStepState value,
          $Res Function(PasswordResetSecondStepState) then) =
      _$PasswordResetSecondStepStateCopyWithImpl<$Res,
          PasswordResetSecondStepState>;
  @useResult
  $Res call(
      {RestrictedPasswordInput passwordInput,
      PasswordRetypeInput passwordRetypeInput});
}

/// @nodoc
class _$PasswordResetSecondStepStateCopyWithImpl<$Res,
        $Val extends PasswordResetSecondStepState>
    implements $PasswordResetSecondStepStateCopyWith<$Res> {
  _$PasswordResetSecondStepStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordResetSecondStepState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordInput = null,
    Object? passwordRetypeInput = null,
  }) {
    return _then(_value.copyWith(
      passwordInput: null == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as RestrictedPasswordInput,
      passwordRetypeInput: null == passwordRetypeInput
          ? _value.passwordRetypeInput
          : passwordRetypeInput // ignore: cast_nullable_to_non_nullable
              as PasswordRetypeInput,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordResetSecondStepStateImplCopyWith<$Res>
    implements $PasswordResetSecondStepStateCopyWith<$Res> {
  factory _$$PasswordResetSecondStepStateImplCopyWith(
          _$PasswordResetSecondStepStateImpl value,
          $Res Function(_$PasswordResetSecondStepStateImpl) then) =
      __$$PasswordResetSecondStepStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RestrictedPasswordInput passwordInput,
      PasswordRetypeInput passwordRetypeInput});
}

/// @nodoc
class __$$PasswordResetSecondStepStateImplCopyWithImpl<$Res>
    extends _$PasswordResetSecondStepStateCopyWithImpl<$Res,
        _$PasswordResetSecondStepStateImpl>
    implements _$$PasswordResetSecondStepStateImplCopyWith<$Res> {
  __$$PasswordResetSecondStepStateImplCopyWithImpl(
      _$PasswordResetSecondStepStateImpl _value,
      $Res Function(_$PasswordResetSecondStepStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PasswordResetSecondStepState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordInput = null,
    Object? passwordRetypeInput = null,
  }) {
    return _then(_$PasswordResetSecondStepStateImpl(
      passwordInput: null == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as RestrictedPasswordInput,
      passwordRetypeInput: null == passwordRetypeInput
          ? _value.passwordRetypeInput
          : passwordRetypeInput // ignore: cast_nullable_to_non_nullable
              as PasswordRetypeInput,
    ));
  }
}

/// @nodoc

class _$PasswordResetSecondStepStateImpl extends _PasswordResetSecondStepState {
  const _$PasswordResetSecondStepStateImpl(
      {this.passwordInput = const RestrictedPasswordInput.pure(),
      this.passwordRetypeInput = const PasswordRetypeInput.pure()})
      : super._();

  @override
  @JsonKey()
  final RestrictedPasswordInput passwordInput;
  @override
  @JsonKey()
  final PasswordRetypeInput passwordRetypeInput;

  @override
  String toString() {
    return 'PasswordResetSecondStepState(passwordInput: $passwordInput, passwordRetypeInput: $passwordRetypeInput)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetSecondStepStateImpl &&
            (identical(other.passwordInput, passwordInput) ||
                other.passwordInput == passwordInput) &&
            (identical(other.passwordRetypeInput, passwordRetypeInput) ||
                other.passwordRetypeInput == passwordRetypeInput));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, passwordInput, passwordRetypeInput);

  /// Create a copy of PasswordResetSecondStepState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetSecondStepStateImplCopyWith<
          _$PasswordResetSecondStepStateImpl>
      get copyWith => __$$PasswordResetSecondStepStateImplCopyWithImpl<
          _$PasswordResetSecondStepStateImpl>(this, _$identity);
}

abstract class _PasswordResetSecondStepState
    extends PasswordResetSecondStepState {
  const factory _PasswordResetSecondStepState(
          {final RestrictedPasswordInput passwordInput,
          final PasswordRetypeInput passwordRetypeInput}) =
      _$PasswordResetSecondStepStateImpl;
  const _PasswordResetSecondStepState._() : super._();

  @override
  RestrictedPasswordInput get passwordInput;
  @override
  PasswordRetypeInput get passwordRetypeInput;

  /// Create a copy of PasswordResetSecondStepState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordResetSecondStepStateImplCopyWith<
          _$PasswordResetSecondStepStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
