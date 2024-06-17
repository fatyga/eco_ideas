import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  static String name = 'password';
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
      ]),
    );
  }
}
