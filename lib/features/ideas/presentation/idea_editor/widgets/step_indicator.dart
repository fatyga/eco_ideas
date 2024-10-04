import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepIndicator extends ConsumerWidget {
  const StepIndicator({
    required this.currentStepId,
    required this.lastStepId,
    required this.onStepIdChange,
    required this.onStepAdd,
    super.key,
  });

  final int currentStepId;
  final int lastStepId;
  final void Function(int stepId) onStepIdChange;
  final VoidCallback onStepAdd;

  void nextStep() => onStepIdChange(currentStepId + 1);
  void previousStep() => onStepIdChange(currentStepId - 1);

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
