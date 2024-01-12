import 'package:eco_ideas/features/auth/auth.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_reset_first_step_state.freezed.dart';

enum PasswordResetFirstStepStatus { initial, linkSent }

@freezed
class PasswordResetFirstStepState with _$PasswordResetFirstStepState {
  const PasswordResetFirstStepState._();
  const factory PasswordResetFirstStepState({
    @Default(PasswordResetFirstStepStatus.initial)
    PasswordResetFirstStepStatus status,
    @Default(EmailInput.pure()) EmailInput emailInput,
  }) = _PasswordResetFirstStepState;

  bool get isLinkSent => status == PasswordResetFirstStepStatus.linkSent;
}

extension InputsValidity on PasswordResetFirstStepState {
  bool get isValid => Formz.validate(
        [
          emailInput,
        ],
      );
}
