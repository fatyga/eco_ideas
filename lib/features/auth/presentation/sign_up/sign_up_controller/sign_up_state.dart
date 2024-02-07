import 'package:eco_ideas/features/auth/data/auth_repository/auth_failure/auth_failure.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_failure/auth_failure_ui_extension.dart';
import 'package:eco_ideas/features/auth/domain/input_models/email_input.dart';

import 'package:eco_ideas/features/auth/domain/input_models/password_retype_input.dart';
import 'package:eco_ideas/features/auth/domain/input_models/restricted_password_input.dart';
import 'package:eco_ideas/features/auth/domain/input_models/username_input.dart';
import 'package:eco_ideas/features/auth/presentation/auth_state_mixin.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState, AuthStateSnackBarOnErrorMixin {
  const factory SignUpState({
    @Default(UsernameInput.pure()) UsernameInput usernameInput,
    @Default(EmailInput.pure()) EmailInput emailInput,
    @Default(RestrictedPasswordInput.pure())
    RestrictedPasswordInput passwordInput,
    @Default(PasswordRetypeInput.pure())
    PasswordRetypeInput passwordRetypeInput,
    String? avatarUrl,
  }) = _SignUpState;
}

extension FieldsValidity on SignUpState {
  bool get isValid => Formz.validate(
        [
          usernameInput,
          emailInput,
          passwordInput,
          passwordRetypeInput,
        ],
      );
}
