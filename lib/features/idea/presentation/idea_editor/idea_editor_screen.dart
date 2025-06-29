import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/utils/async_value_extension.dart';

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
    final notifier = ref.read(ideaEditorControllerProvider.notifier);
    final state = ref.watch(ideaEditorControllerProvider);

    ref.listen(
      ideaEditorControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    return state.when(
        data: (ideaEditorState) {
          return Scaffold(
            appBar: AppBar(
              // TODO(fatyga): back button should by showed implicitly
              leading: IconButton(
                onPressed: () =>
                    !state.isLoading ? context.go('/myIdeas') : null,
                icon: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.undo)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.redo)),
                SaveButton(
                  onPressed: notifier.requestChangesSave,
                  isSaving: state.isLoading,
                ),
              ],
            ),
            body: Padding(
              padding: context.paddings.allLarge,
              child: Builder(
                builder: (context) {
                  if (ideaEditorState.isIntroduction) {
                    return IdeaIntroductionForm(
                      idea: ideaEditorState.idea,
                    );
                  } else {
                    return IdeaStepForm(
                      key: ValueKey(
                        '${ideaEditorState.idea.id}/${ideaEditorState.currentIndex}',
                      ),
                      ideaStep: ideaEditorState
                          .idea.steps[state.requireValue.currentIndex],
                    );
                  }
                },
              ),
            ),
            bottomSheet: state.isLoading
                ? null
                : IdeaEditorNavigator(
                    editorState: ideaEditorState,
                  ),
          );
        },
        error: (e, _) => const Center(child: Text(('error'))),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
