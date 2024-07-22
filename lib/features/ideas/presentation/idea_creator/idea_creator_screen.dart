import 'package:eco_ideas/features/ideas/presentation/idea_creator/widgets/step_indicator.dart';
import 'package:flutter/material.dart';

class IdeaCreatorScreen extends StatelessWidget {
  const IdeaCreatorScreen({super.key});

  static const String routePath = 'ideaCreator';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Idea title')),
        body: Column(children: [ListView(), const StepIndicator()]));
  }
}
