import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/features/idea/presentation/idea_editor/components/idea_step_form.dart';
import 'package:eco_ideas/utils/async_value_extension.dart';
import 'package:eco_ideas/utils/loading_widget.dart';

import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IdeaEditorScreen extends ConsumerStatefulWidget {
  const IdeaEditorScreen({super.key});

  @override
  ConsumerState<IdeaEditorScreen> createState() => _IdeaEditorScreenState();
}

class _IdeaEditorScreenState extends ConsumerState<IdeaEditorScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final notifier = ref.read(ideaEditorControllerProvider.notifier);
    final state = ref.watch(ideaEditorControllerProvider);
    final data = state.requireValue;

    ref.listen(
      ideaEditorControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    return LoadingFeedback(
      isLoading: state.isLoading,
      child: Scaffold(
        appBar: AppBar(
          // TODO(fatyga): back button should by showed implicitly
          leading: IconButton(
            onPressed: () => context.go('/myIdeas'),
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.undo)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.redo)),
            IconButton(
              onPressed: notifier.requestSaveChanges,
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: Padding(
          padding: context.paddings.allLarge,
          child: Builder(
            builder: (context) {
              if (data.isIntroductionMode) {
                return IdeaIntroductionForm(
                  idea: data.idea,
                );
              } else {
                return IdeaStepForm(
                  ideaStep: data.idea.steps[data.currentIndex],
                );
              }
            },
          ),
        ),
        bottomSheet: IdeaEditorNavigator(
          editorState: data,
        ),
      ),
    );
  }
}
