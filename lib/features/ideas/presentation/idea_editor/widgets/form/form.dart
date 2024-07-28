import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/form/description_field.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/form/image_field.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/form/title_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class IdeaCreatorForm extends StatefulWidget {
  const IdeaCreatorForm({super.key});

  @override
  State<IdeaCreatorForm> createState() => _IdeaCreatorFormState();
}

class _IdeaCreatorFormState extends State<IdeaCreatorForm> {
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: ListView(
        children: const [
          IdeaStepImageField(),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(height: 12),
                IdeaStepTitleField(),
                SizedBox(height: 12),
                IdeaStepDescriptionField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
