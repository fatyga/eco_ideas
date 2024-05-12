part of 'ei_form_model.dart';

class SignInFormModel extends EIFormModel {
  SignInFormModel({
    this.emailInput = const EmailInput.pure(),
    this.passwordInput = const PasswordInput.pure(),
  });
  final EmailInput emailInput;
  final PasswordInput passwordInput;

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [emailInput, passwordInput];
}
