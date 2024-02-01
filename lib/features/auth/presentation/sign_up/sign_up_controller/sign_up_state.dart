import 'package:eco_ideas/features/auth/data/auth_repository/auth_failure/auth_failure.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_failure/auth_failure_ui_extension.dart';
import 'package:eco_ideas/features/auth/domain/input_models/email_input.dart';

import 'package:eco_ideas/features/auth/domain/input_models/password_retype_input.dart';
import 'package:eco_ideas/features/auth/domain/input_models/restricted_password_input.dart';
import 'package:eco_ideas/features/auth/domain/input_models/username_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
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

extension SignInStateUI on AsyncValue<SignUpState> {
  void showSnackBarOnError(BuildContext context) => whenOrNull<void>(
        error: (error, __) {
          if (error is AuthFailure) {
            final errorText = error.resloveMessageForUser(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(errorText)));
          }
        },
      );
}
