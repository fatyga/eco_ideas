import 'package:eco_ideas/features/idea/idea.dart';

extension MutableIdeaExtension on Idea {
  Idea withNewStep(IdeaStep step) {
    final steps = List<IdeaStep>.from(this.steps)..add(step);

    return copyWith(steps: steps);
  }

  Idea withUpdatedStep(int index, IdeaStep step) {
    final steps = List<IdeaStep>.from(this.steps);
    steps[index] = step;

    return copyWith(steps: steps);
  }
}
