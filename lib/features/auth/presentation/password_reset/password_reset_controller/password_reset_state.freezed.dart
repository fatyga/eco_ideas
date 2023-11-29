// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_reset_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordResetState {
  PasswordResetStep get step => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordResetStateCopyWith<PasswordResetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetStateCopyWith<$Res> {
  factory $PasswordResetStateCopyWith(
          PasswordResetState value, $Res Function(PasswordResetState) then) =
      _$PasswordResetStateCopyWithImpl<$Res, PasswordResetState>;
  @useResult
  $Res call({PasswordResetStep step, String? email});
}

/// @nodoc
class _$PasswordResetStateCopyWithImpl<$Res, $Val extends PasswordResetState>
    implements $PasswordResetStateCopyWith<$Res> {
  _$PasswordResetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as PasswordResetStep,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PasswordResetStateCopyWith<$Res>
    implements $PasswordResetStateCopyWith<$Res> {
  factory _$$_PasswordResetStateCopyWith(_$_PasswordResetState value,
          $Res Function(_$_PasswordResetState) then) =
      __$$_PasswordResetStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PasswordResetStep step, String? email});
}

/// @nodoc
class __$$_PasswordResetStateCopyWithImpl<$Res>
    extends _$PasswordResetStateCopyWithImpl<$Res, _$_PasswordResetState>
    implements _$$_PasswordResetStateCopyWith<$Res> {
  __$$_PasswordResetStateCopyWithImpl(
      _$_PasswordResetState _value, $Res Function(_$_PasswordResetState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? email = freezed,
  }) {
    return _then(_$_PasswordResetState(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as PasswordResetStep,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PasswordResetState implements _PasswordResetState {
  const _$_PasswordResetState(
      {this.step = PasswordResetStep.initial, this.email});

  @override
  @JsonKey()
  final PasswordResetStep step;
  @override
  final String? email;

  @override
  String toString() {
    return 'PasswordResetState(step: $step, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordResetState &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, step, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordResetStateCopyWith<_$_PasswordResetState> get copyWith =>
      __$$_PasswordResetStateCopyWithImpl<_$_PasswordResetState>(
          this, _$identity);
}

abstract class _PasswordResetState implements PasswordResetState {
  const factory _PasswordResetState(
      {final PasswordResetStep step,
      final String? email}) = _$_PasswordResetState;

  @override
  PasswordResetStep get step;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordResetStateCopyWith<_$_PasswordResetState> get copyWith =>
      throw _privateConstructorUsedError;
}