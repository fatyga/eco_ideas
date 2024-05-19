import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models.dart';
import 'package:formz/formz.dart';

class PasswordResetSecondStepForm with FormzMixin {
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
