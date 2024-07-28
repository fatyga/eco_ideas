import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class IdeaStepTitleField extends StatelessWidget {
  const IdeaStepTitleField({super.key});

  static const String name = 'title';
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(labelText: l10n.ideaStepTitleFieldLabelText),
    );
  }
}
