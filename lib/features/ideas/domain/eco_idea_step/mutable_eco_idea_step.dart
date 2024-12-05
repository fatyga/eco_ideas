import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step_addon/eco_idea_step_addon.dart';

extension MutableEcoIdeaStep on EcoIdeaStep {
  EcoIdeaStep withUpdatedAddon(EcoIdeaStepAddon updatedAddon) {
    final addons = List<EcoIdeaStepAddon>.from(this.addons);

    if (addons.isEmpty) {
      return copyWith(addons: [updatedAddon]);
    } else {
      final index = addons
          .indexWhere((addon) => addon.fieldName == updatedAddon.fieldName);

      if (index != -1) {
        addons[index] = updatedAddon;
      } else {
        addons.add(updatedAddon);
      }
      return copyWith(addons: addons);
    }
  }
}
