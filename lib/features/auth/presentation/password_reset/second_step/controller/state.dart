import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/presentation/auth_state_mixin.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class PasswordResetSecondStepState
    with _$PasswordResetSecondStepState, AuthStateSnackBarOnErrorMixin {
  const factory PasswordResetSecondStepState({
    @Default(RestrictedPasswordInput.pure())
    RestrictedPasswordInput passwordInput,
    @Default(PasswordRetypeInput.pure())
    PasswordRetypeInput passwordRetypeInput,
  }) = _PasswordResetSecondStepState;
  const PasswordResetSecondStepState._();
}

extension InputsValidity on PasswordResetSecondStepState {
  bool get isValid => Formz.validate(
        [passwordInput, passwordRetypeInput],
      );
}
