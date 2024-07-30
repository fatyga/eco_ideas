import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class IdeaNotePointField extends StatelessWidget {
  const IdeaNotePointField({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'point',
    );
  }
}
