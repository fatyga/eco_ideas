import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/step_indicator.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_presenter/widgets/idea_step_content.dart';
import 'package:flutter/material.dart';

class IdeaPresenterScreen extends StatefulWidget {
  const IdeaPresenterScreen({
    required this.idea,
    this.initialStepId = 1,
    super.key,
  });

  static const String path = 'ideaPresenter';
  final EcoIdea idea;
  final int initialStepId;

  @override
  State<IdeaPresenterScreen> createState() => _IdeaPresenterScreenState();
}

class _IdeaPresenterScreenState extends State<IdeaPresenterScreen> {
  late int currentStepId;

  EcoIdeaStep get currentStep => widget.idea.steps[currentStepId];

  @override
  void initState() {
    currentStepId = widget.initialStepId;
    super.initState();
  }

  // Step indicator
  void onStepIdChange(int stepId) => setState(() {
        currentStepId = stepId;
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IdeaStepContent(step: currentStep),
      bottomSheet: StepIndicator(
        currentStepId: currentStepId,
        lastStepId: widget.idea.steps.last.id,
        onStepIdChange: onStepIdChange,
      ),
    );
  }
}
