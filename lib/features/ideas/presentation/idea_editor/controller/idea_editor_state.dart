import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'idea_editor_state.freezed.dart';

@freezed
class IdeaEditorState with _$IdeaEditorState {
  const factory IdeaEditorState({
    required EcoIdea idea,
    @Default(0) int stepIndex,
  }) = _IdeaEditorState;

  const IdeaEditorState._();
  EcoIdeaStep get currentStep => idea.steps[stepIndex];
}
