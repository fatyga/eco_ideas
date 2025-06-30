import 'package:eco_ideas/features/idea/idea.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'idea_editor_state.freezed.dart';

// -1 means introduction
// 0  (idea.steps.length-1) means step
// (Idea.steps.length) means summary

@freezed
class IdeaEditorState with _$IdeaEditorState {
  const factory IdeaEditorState({
    required Idea idea,
    @Default(-1) int currentIndex,
    @Default(false) bool isSaveChangesRequested,
  }) = _IdeaEditorState;

  const IdeaEditorState._();

  bool get isIntroduction => currentIndex == -1;

  bool get isStep => currentIndex >= 0 && currentIndex < idea.steps.length;

  bool get isSummary => currentIndex == idea.steps.length;

  bool get canStepBack => !isIntroduction;

  bool get canStepForward =>
      (isIntroduction && idea.steps.isNotEmpty) ||
      (isStep && currentIndex < idea.steps.length - 1);

  bool get canAddStep =>
      (isIntroduction && idea.steps.isEmpty) ||
      (isStep && currentIndex == idea.steps.length - 1);
}
