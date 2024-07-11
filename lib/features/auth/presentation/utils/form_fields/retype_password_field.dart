import 'package:eco_ideas/features/auth/presentation/utils/form_fields/password_field.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RetypePasswordField extends StatelessWidget {
  const RetypePasswordField({super.key});

  static String name = 'retypePassword';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final passwordField = FormBuilder.of(context)!.fields[PasswordField.name];

    return FormBuilderTextField(
      name: 'password',
      decoration: InputDecoration(labelText: l10n.passwordRetypeFieldLabelText),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: true,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: l10n.requiredValidatorErrorText,
        ),
        (value) {
          return passwordField?.value != value
              ? l10n.signUpPasswordRetypeInputMismatchErrorText
              : null;
        },
      ]),
    );
  }
}
