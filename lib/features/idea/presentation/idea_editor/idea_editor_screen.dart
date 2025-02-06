import 'dart:ffi';

import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/features/idea/presentation/idea_editor/components/idea_step_form.dart';
import 'package:eco_ideas/features/idea/presentation/idea_editor/components/step_indicator.dart';
import 'package:eco_ideas/features/user/data/data.dart';

import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IdeaEditorScreen extends ConsumerStatefulWidget {
  const IdeaEditorScreen({this.idea, super.key});

  // If null, we want to create new idea
  final Idea? idea;

  @override
  ConsumerState<IdeaEditorScreen> createState() => _IdeaEditorScreenState();
}

class _IdeaEditorScreenState extends ConsumerState<IdeaEditorScreen> {
  int currentStepIndex = 0;
  late Idea idea;

  IdeaStep get currentStep => idea.steps[currentStepIndex];

  void _createNewIdea() {
    final userId = ref.read(userRepositoryProvider).currentUser!.id;

    idea = Idea.empty(userId: userId);
  }

  void updateIdea(Idea updatedIdea) {
    setState(() {
      idea = updatedIdea;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.idea != null) {
      idea = widget.idea!;
    } else {
      _createNewIdea();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.paddings.allLarge,
        child: currentStepIndex == 0
            ? IdeaForm(idea: idea)
            : IdeaStepForm(step: currentStep),
      ),
      bottomSheet:
          StepIndicator(index: currentStepIndex, stepsCount: idea.steps.length),
    );
  }
}
