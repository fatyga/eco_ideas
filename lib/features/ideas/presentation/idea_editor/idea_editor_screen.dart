import 'package:eco_ideas/common/extensions/snackbar_on_error.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/first_step/first_step_screen.dart';

import 'package:eco_ideas/features/ideas/presentation/idea_editor/controller/idea_editor_controller.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/idea_step_form.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/step_indicator.dart';
import 'package:eco_ideas/router/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IdeaEditorScreen extends ConsumerStatefulWidget {
  const IdeaEditorScreen({required this.ideaId, super.key});

  final String ideaId;
  static const String routePath = 'ideaEditor';

  @override
  ConsumerState<IdeaEditorScreen> createState() => _IdeaEditorScreenState();
}

class _IdeaEditorScreenState extends ConsumerState<IdeaEditorScreen> {
  bool initialBuildDone = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(ideaEditorControllerProvider(widget.ideaId));

    if (!initialBuildDone) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceBright.withOpacity(0.6),
        ),
        child: const CircularProgressIndicator(),
      );
    }

    return Scaffold(
        bottomSheet: StepIndicator(type: state.asData!.value.currentStep.type),
        body: IdeaStepForm(step: state.asData!.value.currentStep));
  }
}
