import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_reset_state.freezed.dart';

enum PasswordResetStep { initial, sendingLink, settingPassword }

@freezed
class PasswordResetState with _$PasswordResetState {
  const factory PasswordResetState({
    @Default(PasswordResetStep.initial) PasswordResetStep step,
    String? email,
  }) = _PasswordResetState;
}
