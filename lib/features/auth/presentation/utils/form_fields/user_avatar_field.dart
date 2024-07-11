import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

class UserAvatarField extends StatelessWidget {
  const UserAvatarField({super.key});

  static const String name = 'userAvatar';
  @override
  Widget build(BuildContext context) {
    return FormBuilderImagePicker(name: name);
  }
}
