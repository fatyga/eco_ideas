import 'package:eco_ideas/features/idea/data/idea_repository.dart';
import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/features/user/data/data.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'idea_editor_controller.g.dart';

@riverpod
class IdeaEditorController extends _$IdeaEditorController {
  @override
  Future<IdeaEditorState> build() async {
    // TODO(fatyga): use currentUserProfileProvider instead
    final userId = ref.read(userRepositoryProvider).currentUser!.id;
    return IdeaEditorState(
      idea: Idea.empty(userId: userId),
    );
  }

  void requestSaveChanges() {
    state =
        AsyncData(state.requireValue.copyWith(isSaveChangesRequested: true));
  }

  Future<void> saveChangesInStep(IdeaStep updatedIdeaStep) async {
    state = const AsyncLoading();

    final result =
        await ref.read(ideaRepositoryProvider).updateStep(updatedIdeaStep);
    state = AsyncData(
      state.requireValue.copyWith(
        isSaveChangesRequested: false,
        idea: state.requireValue.idea.withUpdatedStep(result),
      ),
    );
  }

  Future<void> saveChangesInIntroduction(Idea updatedIdea) async {
    state = const AsyncLoading();

    final result =
        await ref.read(ideaRepositoryProvider).updateIdea(updatedIdea);
    state = AsyncData(
      state.requireValue.copyWith(
        isSaveChangesRequested: false,
        idea: result.copyWith(steps: state.requireValue.idea.steps),
      ),
    );
  }

  void addStep() {
    final stateValue = state.requireValue;

    if (!stateValue.isSummaryMode) {
      // TODO(fatyga): simplify new index assignment
      final updatedIdea = stateValue.idea.withNewStep(
        IdeaStep(id: stateValue.idea.steps.length, ideaId: stateValue.idea.id),
      );
      state = AsyncData(
        stateValue.copyWith(
          idea: updatedIdea,
          currentIndex: updatedIdea.steps.length - 1,
        ),
      );
    }
  }

  void stepBack() {
    final stateValue = state.requireValue;
    if (stateValue.isIntroductionMode) return;

    state = AsyncData(
      stateValue.copyWith(currentIndex: stateValue.currentIndex - 1),
    );
  }

  void stepForward() {
    final stateValue = state.requireValue;

    if (stateValue.isSummaryMode) return;

    state = AsyncData(
      stateValue.copyWith(currentIndex: stateValue.currentIndex + 1),
    );
  }
}
