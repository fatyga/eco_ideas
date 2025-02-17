import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/features/user/data/data.dart';

import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdeaEditorScreen extends ConsumerStatefulWidget {
  const IdeaEditorScreen({this.idea, super.key});

  // If null, we want to create new idea
  final Idea? idea;

  @override
  ConsumerState<IdeaEditorScreen> createState() => _IdeaEditorScreenState();
}

class _IdeaEditorScreenState extends ConsumerState<IdeaEditorScreen> {
  // If null, we are editing idea introduction
  int? currentStepIndex;
  late Idea idea;

  void _createNewIdea() {
    final userId = ref.read(userRepositoryProvider).currentUser!.id;

    idea = Idea.empty(userId: userId);
  }

  void updateIdea(Idea updatedIdea) {
    setState(() {
      idea = updatedIdea;
    });
  }

  void updateStep(IdeaStep updatedStep) {
    setState(() {
      idea = idea.withUpdatedStep(currentStepIndex!, updatedStep);
    });
  }

  void _addNewStep() {
    idea = idea.withNewStep(IdeaStep(ideaId: idea.id));
    currentStepIndex = idea.steps.length - 1;
    setState(() {});
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
      appBar: AppBar(
        actions: [
          IconButton(icon: const Icon(Icons.save_outlined), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: context.paddings.allLarge,
        child: currentStepIndex == null
            ? IdeaForm(idea: idea, onChanged: updateIdea)
            : IdeaStepForm(
                step: idea.steps[currentStepIndex!],
                onChanged: updateStep,
              ),
      ),
      bottomSheet: Row(children: [
        TextButton(
            onPressed: () {
              if (currentStepIndex != null && currentStepIndex! > 0) {
                setState(() {
                  currentStepIndex = currentStepIndex! - 1;
                });

              }
            },
            child: Text('Previous')),
        TextButton(
            onPressed: () {
              if (currentStepIndex != null && currentStepIndex! < idea.steps.length ) {
                setState(() {
                  currentStepIndex = currentStepIndex! + 1;
                });
                ;
              }
            },
            child: Text('Next')),
        TextButton(onPressed: _addNewStep, child: Text('Add'))
      ]),
    );
  }
}
