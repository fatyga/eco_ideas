import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepIndicator extends ConsumerWidget {
  const StepIndicator(
      {required this.index,
      required this.onPreviousStepTap,
      required this.onNextStepTap,
      super.key});

  final int index;
  final VoidCallback? onPreviousStepTap;
  final VoidCallback? onNextStepTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomSheet(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (onPreviousStepTap != null)
            IconButton(
                onPressed: onPreviousStepTap,
                icon: const Icon(Icons.arrow_back)),
          Text(index == 0 ? 'Introduction' : 'Step $index'),
          if (onNextStepTap != null)
            IconButton(
                onPressed: onNextStepTap,
                icon: const Icon(Icons.arrow_forward)),
        ],
      ),
      onClosing: () {},
    );
  }
}
