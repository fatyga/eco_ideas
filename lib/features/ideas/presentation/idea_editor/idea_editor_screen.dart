import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/form/form.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/step_indicator.dart';

import 'package:flutter/material.dart';

class IdeaEditorScreen extends StatelessWidget {
  const IdeaEditorScreen({super.key});

  static const String routePath = 'ideaCreator';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomSheet: StepIndicator(),
      body: IdeaCreatorForm(),
    );
  }
}
