import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';

extension MutableEcoIdea on EcoIdea {
  EcoIdea withNewStep() {
    final index = this.steps.length;
    final steps = List<EcoIdeaStep>.from(this.steps)
      ..add(EcoIdeaStep.empty(id: index, ideaId: id));

    return copyWith(steps: steps);
  }

  EcoIdea withoutStep(EcoIdeaStep step) {
    final steps = List<EcoIdeaStep>.from(this.steps)..remove(step);

    return copyWith(steps: steps);
  }

  EcoIdea withUpdatedStep(EcoIdeaStep step) {
    final steps = List<EcoIdeaStep>.from(this.steps);
    steps[step.id] = step;

    return copyWith(steps: steps);
  }
}
