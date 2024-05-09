import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models.dart';
import 'package:formz/formz.dart';

class PasswordResetFirstStepForm with FormzMixin {
  PasswordResetFirstStepForm({
    this.emailInput = const EmailInput.pure(),
  });

  final EmailInput emailInput;

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [
        emailInput,
      ];
}
