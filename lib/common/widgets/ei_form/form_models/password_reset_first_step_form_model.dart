part of 'ei_form_model.dart';

class PasswordResetFirstStepForm extends EIFormModel {
  PasswordResetFirstStepForm({
    this.emailInput = const EmailInput.pure(),
  });

  final EmailInput emailInput;

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [
        emailInput,
      ];
}
