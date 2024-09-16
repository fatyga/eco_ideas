import 'package:eco_ideas/common/extensions/snackbar_on_error.dart';

import 'package:eco_ideas/features/ideas/presentation/idea_editor/controller/idea_editor_controller.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/idea_step_form.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/step_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdeaEditorScreen extends ConsumerWidget {
  const IdeaEditorScreen({required this.ideaId, super.key});

  final String? ideaId;
  static const String routePath = 'ideaEditor';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
        .watch(ideaEditorControllerProvider(ideaId))
        .showSnackBarOnError(context);

    return Scaffold(
      bottomSheet: StepIndicator(type: state.currentStep.type),
      body: IdeaStepForm(step: state.currentStep),
    );
  }
}
