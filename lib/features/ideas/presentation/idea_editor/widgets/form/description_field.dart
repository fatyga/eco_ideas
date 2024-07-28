import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class IdeaStepDescriptionField extends StatelessWidget {
  const IdeaStepDescriptionField({super.key});

  static const String name = 'description';
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilderTextField(
      name: name,
      decoration:
          InputDecoration(labelText: l10n.ideaStepDescriptionFieldLabelText),
    );
  }
}
