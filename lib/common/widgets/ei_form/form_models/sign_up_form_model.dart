import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models.dart';
import 'package:formz/formz.dart';

class SignUpForm with FormzMixin {
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
