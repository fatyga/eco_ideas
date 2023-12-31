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
  EmailInput get emailInput => throw _privateConstructorUsedError;

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
  $Res call({PasswordResetStep step, EmailInput emailInput});
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
    Object? emailInput = null,
  }) {
    return _then(_value.copyWith(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as PasswordResetStep,
      emailInput: null == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as EmailInput,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordResetStateImplCopyWith<$Res>
    implements $PasswordResetStateCopyWith<$Res> {
  factory _$$PasswordResetStateImplCopyWith(_$PasswordResetStateImpl value,
          $Res Function(_$PasswordResetStateImpl) then) =
      __$$PasswordResetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PasswordResetStep step, EmailInput emailInput});
}

/// @nodoc
class __$$PasswordResetStateImplCopyWithImpl<$Res>
    extends _$PasswordResetStateCopyWithImpl<$Res, _$PasswordResetStateImpl>
    implements _$$PasswordResetStateImplCopyWith<$Res> {
  __$$PasswordResetStateImplCopyWithImpl(_$PasswordResetStateImpl _value,
      $Res Function(_$PasswordResetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? emailInput = null,
  }) {
    return _then(_$PasswordResetStateImpl(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as PasswordResetStep,
      emailInput: null == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as EmailInput,
    ));
  }
}

/// @nodoc

class _$PasswordResetStateImpl extends _PasswordResetState {
  const _$PasswordResetStateImpl(
      {this.step = PasswordResetStep.initial,
      this.emailInput = const EmailInput.pure()})
      : super._();

  @override
  @JsonKey()
  final PasswordResetStep step;
  @override
  @JsonKey()
  final EmailInput emailInput;

  @override
  String toString() {
    return 'PasswordResetState(step: $step, emailInput: $emailInput)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetStateImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, step, emailInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetStateImplCopyWith<_$PasswordResetStateImpl> get copyWith =>
      __$$PasswordResetStateImplCopyWithImpl<_$PasswordResetStateImpl>(
          this, _$identity);
}

abstract class _PasswordResetState extends PasswordResetState {
  const factory _PasswordResetState(
      {final PasswordResetStep step,
      final EmailInput emailInput}) = _$PasswordResetStateImpl;
  const _PasswordResetState._() : super._();

  @override
  PasswordResetStep get step;
  @override
  EmailInput get emailInput;
  @override
  @JsonKey(ignore: true)
  _$$PasswordResetStateImplCopyWith<_$PasswordResetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
