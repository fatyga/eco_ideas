import 'dart:io';

import 'package:eco_ideas/features/idea/data/idea_repository.dart';
import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/features/user/data/data.dart';
import 'package:image_picker/image_picker.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'idea_editor_controller.g.dart';

@riverpod
class IdeaEditorController extends _$IdeaEditorController {
  @override
  FutureOr<IdeaEditorState> build() {
    ref.onDispose(() {
      ref.read(selectedIdeaProvider.notifier).state = null;
    });
    final selectedIdea = ref.read(selectedIdeaProvider);

    final userId = ref.read(userRepositoryProvider).currentUser!.id;

    return IdeaEditorState(
      idea: selectedIdea ?? Idea.empty(userId: userId),
    );
  }

  void requestSaveChanges() {
    state =
        AsyncData(state.requireValue.copyWith(isSaveChangesRequested: true));
  }

  Future<void> saveStepChanges(IdeaStep updatedIdeaStep, XFile? image) async {
    if (state.requireValue.isStepMode) {
      state = const AsyncLoading();

      state = await AsyncValue.guard(() async {
        var result = updatedIdeaStep;

        if (image != null) {
          final imageUrl = await ref
              .read(ideaRepositoryProvider)
              .uploadIdeaImage(updatedIdeaStep.ideaId, image);
          result = result.copyWith(imageUrl: imageUrl);
        }
        final savedIdeaStep =
            await ref.read(ideaRepositoryProvider).updateStep(result);
        return state.requireValue.copyWith(
          isSaveChangesRequested: false,
          idea: state.requireValue.idea.withUpdatedStep(savedIdeaStep),
        );
      });
    }
  }

  // TODO(fatyga): simplify logic
  Future<void> saveIntroductionChanges(Idea updatedIdea, XFile? image) async {
    if (state.requireValue.isIntroductionMode) {
      state = const AsyncLoading();

      state = await AsyncValue.guard(() async {
        var result = updatedIdea;
        if (image != null) {
          final imageUrl = await ref
              .read(ideaRepositoryProvider)
              .uploadIdeaImage(updatedIdea.id, image);
          result = result.copyWith(imageUrl: imageUrl);
        }

        final savedIdea = await ref
            .read(ideaRepositoryProvider)
            .updateIdeaIntroduction(result);

        return state.requireValue.copyWith(
          isSaveChangesRequested: false,
          idea: savedIdea.copyWith(steps: state.requireValue.idea.steps),
        );
      });
    }
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
