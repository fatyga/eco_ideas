import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class IdeaImageField extends StatelessWidget {
  const IdeaImageField(
      {required this.onSubmit,
      this.withBorder = false,
      this.initialValue,
      super.key});

  final bool withBorder;

  static const String name = 'image';
  final String? initialValue;
  final void Function() onSubmit;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return FormBuilderImagePicker(
      name: name,
      maxImages: 1,
      iconColor: theme.colorScheme.primary,
      backgroundColor: theme.colorScheme.surfaceBright,
      decoration: InputDecoration(
        border: withBorder ? null : InputBorder.none,
        contentPadding: withBorder ? null : EdgeInsets.zero,
      ),
      validator: FormBuilderValidators.required(
          errorText: l10n.requiredValidatorErrorText),
    );
  }
}
