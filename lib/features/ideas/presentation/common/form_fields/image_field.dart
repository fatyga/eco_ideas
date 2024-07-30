import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

class IdeaImageField extends StatelessWidget {
  const IdeaImageField({this.withBorder = false, super.key});

  final bool withBorder;

  static const String name = 'image';
  @override
  Widget build(BuildContext context) {
    return FormBuilderImagePicker(
      name: name,
      decoration: InputDecoration(
        border: withBorder ? null : InputBorder.none,
        contentPadding: withBorder ? null : EdgeInsets.zero,
      ),
    );
  }
}
