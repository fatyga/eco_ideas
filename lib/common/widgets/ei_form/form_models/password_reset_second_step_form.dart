part of 'ei_form_model.dart';

class PasswordResetSecondStepForm extends EIFormModel {
  PasswordResetSecondStepForm({
    this.restrictedPasswordInput = const RestrictedPasswordInput.pure(),
    this.passwordRetypeInput = const PasswordRetypeInput.pure(),
  });

  final RestrictedPasswordInput restrictedPasswordInput;
  final PasswordRetypeInput passwordRetypeInput;

  @override
  List<FormzInput<dynamic, dynamic>> get inputs =>
      [restrictedPasswordInput, passwordRetypeInput];
}
