import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class IdeaDescriptionField extends StatelessWidget {
  const IdeaDescriptionField(
      {required this.onSubmit, this.initialValue, super.key});

  static const String name = 'description';
  final String? initialValue;
  final void Function() onSubmit;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Focus(
      onFocusChange: (value) {
        if (!value) onSubmit();
      },
      child: FormBuilderTextField(
        name: name,
        initialValue: initialValue,
        maxLines: null,
        decoration:
            InputDecoration(labelText: l10n.ideaStepDescriptionFieldLabelText),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            errorText: l10n.requiredValidatorErrorText,
          ),
        ]),
      ),
    );
  }
}
