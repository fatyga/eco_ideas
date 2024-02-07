import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_failure/auth_failure.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_failure/auth_failure_ui_extension.dart';
import 'package:eco_ideas/features/auth/presentation/auth_state_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState, AuthStateSnackBarOnErrorMixin {
  const factory SignInState({
    @Default(EmailInput.pure()) EmailInput emailInput,
    @Default(PasswordInput.pure()) PasswordInput passwordInput,
  }) = _SignInState;
  const SignInState._();
}

extension InputsValidity on SignInState {
  bool get isValid => Formz.validate([emailInput, passwordInput]);
}
