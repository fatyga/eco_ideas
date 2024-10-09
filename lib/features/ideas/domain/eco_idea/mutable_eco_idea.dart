import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';

extension MutableEcoIdea on EcoIdea {
  EcoIdea addStep() {
    final index = this.steps.length;
    final steps = List<EcoIdeaStep>.from(this.steps)
      ..add(EcoIdeaStep.empty(id: index, ideaId: id));

    return copyWith(steps: steps);
  }

  EcoIdea removeStep(EcoIdeaStep step) {
    final steps = List<EcoIdeaStep>.from(this.steps)..remove(step);

    return copyWith(steps: steps);
  }

  EcoIdea updateStep(EcoIdeaStep step) {
    final steps = List<EcoIdeaStep>.from(this.steps);
    steps[step.id] = step;

    return copyWith(steps: steps);
  }
}
