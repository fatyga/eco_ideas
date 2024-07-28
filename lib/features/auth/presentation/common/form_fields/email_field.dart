import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  static String name = 'email';
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilderTextField(
      name: 'email',
      decoration: InputDecoration(labelText: l10n.emailTextFieldLabelText),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: l10n.requiredValidatorErrorText,
        ),
        FormBuilderValidators.email(
          errorText: l10n.emailInputInvalidErrorText,
        ),
      ]),
    );
  }
}
