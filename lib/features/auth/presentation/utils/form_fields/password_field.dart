import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({this.restricted = false, super.key});

  static String name = 'password';

  final bool restricted;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilderTextField(
      name: 'password',
      decoration: InputDecoration(labelText: l10n.passwordTextFieldLabelText),
      obscureText: true,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: l10n.requiredValidatorErrorText,
        ),
        FormBuilderValidators.minLength(8),
        if (restricted) ...[
          FormBuilderValidators.match(
            '[A-Z]+',
            errorText: l10n.restrictedPasswordInputErrorUppercaseNotPresent,
          ),
          FormBuilderValidators.match(
            '[0-9]+',
            errorText: l10n.restrictedPasswordInputErrorDigitNotPresent,
          ),
          //TODO(fatyga): add all available special characters to pattern
          FormBuilderValidators.match(
            r'[!@#$%^&*]+',
            errorText:
                l10n.restrictedPasswordInputErrorSpecialCharacterNotPresentText,
          ),
        ],
      ]),
    );
  }
}
