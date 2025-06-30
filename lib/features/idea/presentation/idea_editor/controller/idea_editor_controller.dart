import 'dart:io';

import 'package:eco_ideas/features/idea/data/idea_repository.dart';
import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/features/user/data/data.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'idea_editor_controller.g.dart';

@riverpod
class IdeaEditorController extends _$IdeaEditorController {
  @override
  FutureOr<IdeaEditorState> build() async {
    ref.onDispose(() {
      ref.read(selectedIdeaProvider.notifier).state = null;
    });
    final selectedIdea = ref.read(selectedIdeaProvider);

    final userProfile = await ref.read(currentUserProfileProvider.future);

    return IdeaEditorState(
      idea: selectedIdea ?? Idea.empty(userId: userProfile.id),
    );
  }

  void requestChangesSave() {
    state =
        AsyncData(state.requireValue.copyWith(isSaveChangesRequested: true));
  }

  void cancelChangesSaveRequest() {
    state =
        AsyncData(state.requireValue.copyWith(isSaveChangesRequested: false));
  }

  Future<void> saveStepChanges(IdeaStep updatedIdeaStep, XFile? image) async {
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

  // TODO(fatyga): simplify logic
  Future<void> saveIntroductionChanges(Idea updatedIdea, XFile? image) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      var result = updatedIdea;
      if (image != null) {
        final imageUrl = await ref
            .read(ideaRepositoryProvider)
            .uploadIdeaImage(updatedIdea.id, image);
        result = result.copyWith(imageUrl: imageUrl);
      }

      final savedIdea =
          await ref.read(ideaRepositoryProvider).updateIdeaIntroduction(result);

      return state.requireValue.copyWith(
        isSaveChangesRequested: false,
        idea: savedIdea.copyWith(steps: state.requireValue.idea.steps),
      );
    });
  }

  void addStep() {
    if (state.isLoading) return;

    final stateValue = state.requireValue;

    if (!stateValue.isSummary) {
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
    if (state.isLoading) return;
    final stateValue = state.requireValue;
    if (stateValue.isIntroduction) return;

    state = AsyncData(
      stateValue.copyWith(
        currentIndex: stateValue.currentIndex - 1,
      ),
    );
  }

  void stepForward() {
    if (state.isLoading) return;
    final stateValue = state.requireValue;

    if (stateValue.isSummary) return;

    state = AsyncData(
      stateValue.copyWith(
        currentIndex: stateValue.currentIndex + 1,
      ),
    );
  }
}
