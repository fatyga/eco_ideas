import 'package:eco_ideas/features/auth/auth.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(EmailInput.pure()) EmailInput emailInput,
    @Default(PasswordInput.pure()) PasswordInput passwordInput,
  }) = _SignInState;
  const SignInState._();
}

extension InputsValidity on SignInState {
  bool get isValid => Formz.validate([emailInput, passwordInput]);
}
