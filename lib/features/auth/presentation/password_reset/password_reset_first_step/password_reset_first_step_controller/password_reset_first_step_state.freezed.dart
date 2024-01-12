// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_reset_first_step_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordResetFirstStepState {
  PasswordResetFirstStepStatus get status => throw _privateConstructorUsedError;
  EmailInput get emailInput => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordResetFirstStepStateCopyWith<PasswordResetFirstStepState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetFirstStepStateCopyWith<$Res> {
  factory $PasswordResetFirstStepStateCopyWith(
          PasswordResetFirstStepState value,
          $Res Function(PasswordResetFirstStepState) then) =
      _$PasswordResetFirstStepStateCopyWithImpl<$Res,
          PasswordResetFirstStepState>;
  @useResult
  $Res call({PasswordResetFirstStepStatus status, EmailInput emailInput});
}

/// @nodoc
class _$PasswordResetFirstStepStateCopyWithImpl<$Res,
        $Val extends PasswordResetFirstStepState>
    implements $PasswordResetFirstStepStateCopyWith<$Res> {
  _$PasswordResetFirstStepStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? emailInput = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PasswordResetFirstStepStatus,
      emailInput: null == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as EmailInput,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordResetFirstStepStateImplCopyWith<$Res>
    implements $PasswordResetFirstStepStateCopyWith<$Res> {
  factory _$$PasswordResetFirstStepStateImplCopyWith(
          _$PasswordResetFirstStepStateImpl value,
          $Res Function(_$PasswordResetFirstStepStateImpl) then) =
      __$$PasswordResetFirstStepStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PasswordResetFirstStepStatus status, EmailInput emailInput});
}

/// @nodoc
class __$$PasswordResetFirstStepStateImplCopyWithImpl<$Res>
    extends _$PasswordResetFirstStepStateCopyWithImpl<$Res,
        _$PasswordResetFirstStepStateImpl>
    implements _$$PasswordResetFirstStepStateImplCopyWith<$Res> {
  __$$PasswordResetFirstStepStateImplCopyWithImpl(
      _$PasswordResetFirstStepStateImpl _value,
      $Res Function(_$PasswordResetFirstStepStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? emailInput = null,
  }) {
    return _then(_$PasswordResetFirstStepStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PasswordResetFirstStepStatus,
      emailInput: null == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as EmailInput,
    ));
  }
}

/// @nodoc

class _$PasswordResetFirstStepStateImpl extends _PasswordResetFirstStepState {
  const _$PasswordResetFirstStepStateImpl(
      {this.status = PasswordResetFirstStepStatus.initial,
      this.emailInput = const EmailInput.pure()})
      : super._();

  @override
  @JsonKey()
  final PasswordResetFirstStepStatus status;
  @override
  @JsonKey()
  final EmailInput emailInput;

  @override
  String toString() {
    return 'PasswordResetFirstStepState(status: $status, emailInput: $emailInput)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetFirstStepStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, emailInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetFirstStepStateImplCopyWith<_$PasswordResetFirstStepStateImpl>
      get copyWith => __$$PasswordResetFirstStepStateImplCopyWithImpl<
          _$PasswordResetFirstStepStateImpl>(this, _$identity);
}

abstract class _PasswordResetFirstStepState
    extends PasswordResetFirstStepState {
  const factory _PasswordResetFirstStepState(
      {final PasswordResetFirstStepStatus status,
      final EmailInput emailInput}) = _$PasswordResetFirstStepStateImpl;
  const _PasswordResetFirstStepState._() : super._();

  @override
  PasswordResetFirstStepStatus get status;
  @override
  EmailInput get emailInput;
  @override
  @JsonKey(ignore: true)
  _$$PasswordResetFirstStepStateImplCopyWith<_$PasswordResetFirstStepStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
