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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpState {
  UsernameInput get usernameInput => throw _privateConstructorUsedError;
  EmailInput get emailInput => throw _privateConstructorUsedError;
  SignUpPasswordInput get passwordInput => throw _privateConstructorUsedError;
  PasswordRetypeInput get passwordRetypeInput =>
      throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

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
      SignUpPasswordInput passwordInput,
      PasswordRetypeInput passwordRetypeInput,
      String? avatarUrl});
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
    Object? avatarUrl = freezed,
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
              as SignUpPasswordInput,
      passwordRetypeInput: null == passwordRetypeInput
          ? _value.passwordRetypeInput
          : passwordRetypeInput // ignore: cast_nullable_to_non_nullable
              as PasswordRetypeInput,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$_SignUpStateCopyWith(
          _$_SignUpState value, $Res Function(_$_SignUpState) then) =
      __$$_SignUpStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UsernameInput usernameInput,
      EmailInput emailInput,
      SignUpPasswordInput passwordInput,
      PasswordRetypeInput passwordRetypeInput,
      String? avatarUrl});
}

/// @nodoc
class __$$_SignUpStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$_SignUpState>
    implements _$$_SignUpStateCopyWith<$Res> {
  __$$_SignUpStateCopyWithImpl(
      _$_SignUpState _value, $Res Function(_$_SignUpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameInput = null,
    Object? emailInput = null,
    Object? passwordInput = null,
    Object? passwordRetypeInput = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$_SignUpState(
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
              as SignUpPasswordInput,
      passwordRetypeInput: null == passwordRetypeInput
          ? _value.passwordRetypeInput
          : passwordRetypeInput // ignore: cast_nullable_to_non_nullable
              as PasswordRetypeInput,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SignUpState implements _SignUpState {
  const _$_SignUpState(
      {this.usernameInput = const UsernameInput.pure(),
      this.emailInput = const EmailInput.pure(),
      this.passwordInput = const SignUpPasswordInput.pure(),
      this.passwordRetypeInput = const PasswordRetypeInput.pure(),
      this.avatarUrl});

  @override
  @JsonKey()
  final UsernameInput usernameInput;
  @override
  @JsonKey()
  final EmailInput emailInput;
  @override
  @JsonKey()
  final SignUpPasswordInput passwordInput;
  @override
  @JsonKey()
  final PasswordRetypeInput passwordRetypeInput;
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'SignUpState(usernameInput: $usernameInput, emailInput: $emailInput, passwordInput: $passwordInput, passwordRetypeInput: $passwordRetypeInput, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpState &&
            (identical(other.usernameInput, usernameInput) ||
                other.usernameInput == usernameInput) &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput) &&
            (identical(other.passwordInput, passwordInput) ||
                other.passwordInput == passwordInput) &&
            (identical(other.passwordRetypeInput, passwordRetypeInput) ||
                other.passwordRetypeInput == passwordRetypeInput) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usernameInput, emailInput,
      passwordInput, passwordRetypeInput, avatarUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      __$$_SignUpStateCopyWithImpl<_$_SignUpState>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  const factory _SignUpState(
      {final UsernameInput usernameInput,
      final EmailInput emailInput,
      final SignUpPasswordInput passwordInput,
      final PasswordRetypeInput passwordRetypeInput,
      final String? avatarUrl}) = _$_SignUpState;

  @override
  UsernameInput get usernameInput;
  @override
  EmailInput get emailInput;
  @override
  SignUpPasswordInput get passwordInput;
  @override
  PasswordRetypeInput get passwordRetypeInput;
  @override
  String? get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
