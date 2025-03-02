import 'package:eco_ideas/features/idea/idea.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'idea_editor_state.freezed.dart';

// -1 means introduction
// 0  (idea.steps.length-1) means step
// (Idea.steps.length) means summary

@freezed
class IdeaEditorState with _$IdeaEditorState {
  const factory IdeaEditorState(
      {required Idea idea,
      @Default(-1) int currentIndex,
      @Default(false) bool isSaveChangesRequested,}) = _IdeaEditorState;

  const IdeaEditorState._();

  bool get isIntroductionMode => currentIndex == -1;

  bool get isStepMode => currentIndex >= 0 && currentIndex < idea.steps.length;

  bool get isSummaryMode => currentIndex == idea.steps.length;

  bool get canStepBack => !isIntroductionMode;

  bool get canStepForward =>
      (isIntroductionMode && idea.steps.isNotEmpty) ||
      (isStepMode && currentIndex < idea.steps.length - 1);

  bool get canAddStep =>
      (isIntroductionMode && idea.steps.isEmpty) ||
      (isStepMode && currentIndex == idea.steps.length - 1);
}
