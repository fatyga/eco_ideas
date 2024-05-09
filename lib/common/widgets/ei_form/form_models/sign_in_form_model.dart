import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models.dart';
import 'package:formz/formz.dart';

class SignInForm with FormzMixin {
  SignInForm({
    this.emailInput = const EmailInput.pure(),
    this.passwordInput = const PasswordInput.pure(),
  });
  final EmailInput emailInput;
  final PasswordInput passwordInput;
  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [emailInput, passwordInput];
}
