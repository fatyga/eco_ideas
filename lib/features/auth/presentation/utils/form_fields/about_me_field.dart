import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AboutMeField extends StatelessWidget {
  const AboutMeField({super.key});

  static const String name = 'aboutMe';
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(name: name);
  }
}
