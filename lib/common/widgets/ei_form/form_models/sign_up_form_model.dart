part of 'ei_form_model.dart';

class SignUpForm extends EIFormModel {
  SignUpForm({
    this.usernameInput = const UsernameInput.pure(),
    this.emailInput = const EmailInput.pure(),
    this.restrictedPasswordInput = const RestrictedPasswordInput.pure(),
    this.passwordRetypeInput = const PasswordRetypeInput.pure(),
  });

  final UsernameInput usernameInput;
  final EmailInput emailInput;
  final RestrictedPasswordInput restrictedPasswordInput;
  final PasswordRetypeInput passwordRetypeInput;

  @override
  List<FormzInput<dynamic, dynamic>> get inputs =>
      [usernameInput, emailInput, restrictedPasswordInput, passwordRetypeInput];
}
