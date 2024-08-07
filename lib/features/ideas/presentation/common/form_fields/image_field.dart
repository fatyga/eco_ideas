import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class IdeaImageField extends StatelessWidget {
  const IdeaImageField({this.withBorder = false, super.key});

  final bool withBorder;

  static const String name = 'image';
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilderImagePicker(
      name: name,
      maxImages: 1,
      decoration: InputDecoration(
        border: withBorder ? null : InputBorder.none,
        contentPadding: withBorder ? null : EdgeInsets.zero,
      ),
      validator: FormBuilderValidators.required(
          errorText: l10n.requiredValidatorErrorText),
    );
  }
}
