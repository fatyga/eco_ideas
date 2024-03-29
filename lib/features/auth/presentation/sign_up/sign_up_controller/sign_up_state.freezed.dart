// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpState {
  UsernameInput get usernameInput => throw _privateConstructorUsedError;
  EmailInput get emailInput => throw _privateConstructorUsedError;
  RestrictedPasswordInput get passwordInput =>
      throw _privateConstructorUsedError;
  PasswordRetypeInput get passwordRetypeInput =>
      throw _privateConstructorUsedError;
  AvatarInput get avatarInput => throw _privateConstructorUsedError;
  SignUpStateStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {UsernameInput usernameInput,
      EmailInput emailInput,
      RestrictedPasswordInput passwordInput,
      PasswordRetypeInput passwordRetypeInput,
      AvatarInput avatarInput,
      SignUpStateStatus status});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameInput = null,
    Object? emailInput = null,
    Object? passwordInput = null,
    Object? passwordRetypeInput = null,
    Object? avatarInput = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      usernameInput: null == usernameInput
          ? _value.usernameInput
          : usernameInput // ignore: cast_nullable_to_non_nullable
              as UsernameInput,
      emailInput: null == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      passwordInput: null == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as RestrictedPasswordInput,
      passwordRetypeInput: null == passwordRetypeInput
          ? _value.passwordRetypeInput
          : passwordRetypeInput // ignore: cast_nullable_to_non_nullable
              as PasswordRetypeInput,
      avatarInput: null == avatarInput
          ? _value.avatarInput
          : avatarInput // ignore: cast_nullable_to_non_nullable
              as AvatarInput,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SignUpStateStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpStateImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpStateImplCopyWith(
          _$SignUpStateImpl value, $Res Function(_$SignUpStateImpl) then) =
      __$$SignUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UsernameInput usernameInput,
      EmailInput emailInput,
      RestrictedPasswordInput passwordInput,
      PasswordRetypeInput passwordRetypeInput,
      AvatarInput avatarInput,
      SignUpStateStatus status});
}

/// @nodoc
class __$$SignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
    implements _$$SignUpStateImplCopyWith<$Res> {
  __$$SignUpStateImplCopyWithImpl(
      _$SignUpStateImpl _value, $Res Function(_$SignUpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameInput = null,
    Object? emailInput = null,
    Object? passwordInput = null,
    Object? passwordRetypeInput = null,
    Object? avatarInput = null,
    Object? status = null,
  }) {
    return _then(_$SignUpStateImpl(
      usernameInput: null == usernameInput
          ? _value.usernameInput
          : usernameInput // ignore: cast_nullable_to_non_nullable
              as UsernameInput,
      emailInput: null == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      passwordInput: null == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as RestrictedPasswordInput,
      passwordRetypeInput: null == passwordRetypeInput
          ? _value.passwordRetypeInput
          : passwordRetypeInput // ignore: cast_nullable_to_non_nullable
              as PasswordRetypeInput,
      avatarInput: null == avatarInput
          ? _value.avatarInput
          : avatarInput // ignore: cast_nullable_to_non_nullable
              as AvatarInput,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SignUpStateStatus,
    ));
  }
}

/// @nodoc

class _$SignUpStateImpl extends _SignUpState {
  const _$SignUpStateImpl(
      {this.usernameInput = const UsernameInput.pure(),
      this.emailInput = const EmailInput.pure(),
      this.passwordInput = const RestrictedPasswordInput.pure(),
      this.passwordRetypeInput = const PasswordRetypeInput.pure(),
      this.avatarInput = const AvatarInput.pure(),
      this.status = SignUpStateStatus.initial})
      : super._();

  @override
  @JsonKey()
  final UsernameInput usernameInput;
  @override
  @JsonKey()
  final EmailInput emailInput;
  @override
  @JsonKey()
  final RestrictedPasswordInput passwordInput;
  @override
  @JsonKey()
  final PasswordRetypeInput passwordRetypeInput;
  @override
  @JsonKey()
  final AvatarInput avatarInput;
  @override
  @JsonKey()
  final SignUpStateStatus status;

  @override
  String toString() {
    return 'SignUpState(usernameInput: $usernameInput, emailInput: $emailInput, passwordInput: $passwordInput, passwordRetypeInput: $passwordRetypeInput, avatarInput: $avatarInput, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.usernameInput, usernameInput) ||
                other.usernameInput == usernameInput) &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput) &&
            (identical(other.passwordInput, passwordInput) ||
                other.passwordInput == passwordInput) &&
            (identical(other.passwordRetypeInput, passwordRetypeInput) ||
                other.passwordRetypeInput == passwordRetypeInput) &&
            (identical(other.avatarInput, avatarInput) ||
                other.avatarInput == avatarInput) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usernameInput, emailInput,
      passwordInput, passwordRetypeInput, avatarInput, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
}

abstract class _SignUpState extends SignUpState {
  const factory _SignUpState(
      {final UsernameInput usernameInput,
      final EmailInput emailInput,
      final RestrictedPasswordInput passwordInput,
      final PasswordRetypeInput passwordRetypeInput,
      final AvatarInput avatarInput,
      final SignUpStateStatus status}) = _$SignUpStateImpl;
  const _SignUpState._() : super._();

  @override
  UsernameInput get usernameInput;
  @override
  EmailInput get emailInput;
  @override
  RestrictedPasswordInput get passwordInput;
  @override
  PasswordRetypeInput get passwordRetypeInput;
  @override
  AvatarInput get avatarInput;
  @override
  SignUpStateStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
