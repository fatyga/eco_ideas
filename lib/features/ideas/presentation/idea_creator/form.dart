import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/ideas/presentation/common/form_fields/description_field.dart';
import 'package:eco_ideas/features/ideas/presentation/common/form_fields/image_field.dart';
import 'package:eco_ideas/features/ideas/presentation/common/form_fields/title_field.dart';
import 'package:eco_ideas/features/ideas/presentation/common/idea_note/idea_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class IdeaCreatorFrom extends StatefulWidget {
  const IdeaCreatorFrom({super.key});

  @override
  State<IdeaCreatorFrom> createState() => _IdeaCreatorFromState();
}

class _IdeaCreatorFromState extends State<IdeaCreatorFrom> {
  bool _isProcessing = false;
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const IdeaImageField(
              key: ValueKey('ideaCreatorFormImageField'),
              withBorder: true,
            ),
            const SizedBox(height: 12),
            const IdeaTitleField(key: ValueKey('ideaCreatorFormTitleField')),
            const SizedBox(height: 12),
            const IdeaDescriptionField(
              key: ValueKey('ideaCreatorDescriptionField'),
            ),
            const SizedBox(height: 12),
            IdeaNote(),
            PrimaryButton(
              isLoading: _isProcessing,
              onPressed: () {},
              child: const Text("Let's go"),
            ),
          ],
        ),
      ),
    );
  }
}
