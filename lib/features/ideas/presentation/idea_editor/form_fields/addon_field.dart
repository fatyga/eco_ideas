import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class IdeaAddonField extends StatelessWidget {
  const IdeaAddonField(
      {required this.name,
      required this.onSubmit,
      this.initialValue,
      super.key});

  final String name;
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
        onEditingComplete: onSubmit,
        maxLines: null,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
          isCollapsed: true,
          contentPadding: EdgeInsets.only(bottom: 4),
          icon: Icon(Icons.circle, size: 8),
          border: UnderlineInputBorder(),
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            errorText: l10n.requiredValidatorErrorText,
          ),
        ]),
      ),
    );
  }
}
