import 'package:eco_ideas/features/ideas/presentation/common/form_fields/description_field.dart';
import 'package:eco_ideas/features/ideas/presentation/common/form_fields/image_field.dart';
import 'package:eco_ideas/features/ideas/presentation/common/form_fields/title_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class IdeaStepForm extends StatefulWidget {
  const IdeaStepForm({super.key});

  @override
  State<IdeaStepForm> createState() => _IdeaStepFormState();
}

class _IdeaStepFormState extends State<IdeaStepForm> {
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: ListView(
        children: const [
          IdeaImageField(),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(height: 12),
                IdeaTitleField(),
                SizedBox(height: 12),
                IdeaDescriptionField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
