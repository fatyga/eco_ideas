import 'package:eco_ideas/features/idea/idea.dart';

sealed class IdeaEditingTarget {
  const IdeaEditingTarget();
}

class IntroductionEditing extends IdeaEditingTarget {}

class StepEditing extends IdeaEditingTarget {
  const StepEditing({required this.step, required this.index});

  final int index;
  final IdeaStep step;
}

class SummaryEditing extends IdeaEditingTarget {}
