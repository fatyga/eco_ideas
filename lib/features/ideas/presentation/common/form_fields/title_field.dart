import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class IdeaTitleField extends StatelessWidget {
  const IdeaTitleField({super.key});

  static const String name = 'title';
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(labelText: l10n.ideaStepTitleFieldLabelText),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: l10n.requiredValidatorErrorText,
        ),
      ]),
    );
  }
}
