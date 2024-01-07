import 'package:eco_ideas/features/auth/auth.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_reset_state.freezed.dart';

enum PasswordResetStep { initial, linkSent }

@freezed
class PasswordResetState with _$PasswordResetState {
  const PasswordResetState._();
  const factory PasswordResetState({
    @Default(PasswordResetStep.initial) PasswordResetStep step,
    @Default(EmailInput.pure()) EmailInput emailInput,
  }) = _PasswordResetState;

  bool get isLinkSent => step == PasswordResetStep.linkSent;
}

extension InputsValidity on PasswordResetState {
  bool get isValid => Formz.validate(
        [
          emailInput,
        ],
      );
}
