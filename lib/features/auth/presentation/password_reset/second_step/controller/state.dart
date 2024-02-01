import 'package:eco_ideas/features/auth/auth.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

enum PasswordResetSecondStepStatus { initial, passwordUpdated }

@freezed
class PasswordResetSecondStepState with _$PasswordResetSecondStepState {
  const factory PasswordResetSecondStepState({
    @Default(PasswordResetSecondStepStatus.initial)
    PasswordResetSecondStepStatus status,
    @Default(RestrictedPasswordInput.pure())
    RestrictedPasswordInput passwordInput,
    @Default(PasswordRetypeInput.pure())
    PasswordRetypeInput passwordRetypeInput,
  }) = _PasswordResetSecondStepState;
  const PasswordResetSecondStepState._();

  bool get isPasswordUpdated =>
      status == PasswordResetSecondStepStatus.passwordUpdated;
}

extension InputsValidity on PasswordResetSecondStepState {
  bool get isValid => Formz.validate(
        [passwordInput, passwordRetypeInput],
      );
}
