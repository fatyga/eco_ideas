import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepIndicator extends ConsumerWidget {
  const StepIndicator({required this.type, super.key});

  final EcoIdeaStepType type;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomSheet(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          Text(
            switch (type) {
              EcoIdeaStepType.introduction => 'Introduction',
              EcoIdeaStepType.standard => 'Step',
              EcoIdeaStepType.summary => 'Summary'
            },
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward)),
        ],
      ),
      onClosing: () {},
    );
  }
}
