import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepIndicator extends ConsumerWidget {
  const StepIndicator({
    required this.currentStepId,
    required this.lastStepId,
    required this.onStepChange,
    required this.onStepAdd,
    super.key,
  });

  final int currentStepId;
  final int lastStepId;
  final void Function(int stepId) onStepChange;
  final VoidCallback onStepAdd;

  void nextStep() => onStepChange(currentStepId + 1);
  void previousStep() => onStepChange(currentStepId - 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomSheet(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: currentStepId != 0,
            child: IconButton(
              onPressed: previousStep,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              currentStepId == 0 ? 'Introduction' : 'Step $currentStepId',
            ),
          ),
          if (currentStepId < lastStepId)
            IconButton(
              onPressed: nextStep,
              icon: const Icon(Icons.arrow_forward),
            ),
          if (currentStepId == lastStepId)
            IconButton(
              onPressed: onStepAdd,
              icon: const Icon(Icons.add),
            ),
        ],
      ),
      onClosing: () {},
    );
  }
}
