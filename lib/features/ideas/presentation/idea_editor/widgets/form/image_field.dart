import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

class IdeaStepImageField extends StatelessWidget {
  const IdeaStepImageField({super.key});

  static const String name = 'image';
  @override
  Widget build(BuildContext context) {
    return FormBuilderImagePicker(
      name: name,
      decoration: const InputDecoration(
          border: InputBorder.none, contentPadding: EdgeInsets.zero),
    );
  }
}
