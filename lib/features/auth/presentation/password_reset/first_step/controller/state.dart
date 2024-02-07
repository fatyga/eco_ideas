import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/presentation/auth_state_mixin.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

enum PasswordResetFirstStepStatus { initial, linkSent }

@freezed
class PasswordResetFirstStepState
    with _$PasswordResetFirstStepState, AuthStateSnackBarOnErrorMixin {
  const factory PasswordResetFirstStepState({
    @Default(PasswordResetFirstStepStatus.initial)
    PasswordResetFirstStepStatus status,
    @Default(EmailInput.pure()) EmailInput emailInput,
  }) = _PasswordResetFirstStepState;
  const PasswordResetFirstStepState._();

  bool get isLinkSent => status == PasswordResetFirstStepStatus.linkSent;
}

extension InputsValidity on PasswordResetFirstStepState {
  bool get isValid => Formz.validate(
        [
          emailInput,
        ],
      );
}
