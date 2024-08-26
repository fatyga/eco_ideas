import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/controller/idea_editor_state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'idea_editor_controller.g.dart';

@riverpod
class IdeaEditorController extends _$IdeaEditorController {
  @override
  IdeaEditorState build(EcoIdea? idea) {
    final userId = ref.watch(userProfileChangesProvider).requireValue.id;

    return IdeaEditorState(idea: idea ?? EcoIdea.draft(profileId: userId));
  }
}
