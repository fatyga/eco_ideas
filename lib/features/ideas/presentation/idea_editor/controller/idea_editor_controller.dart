import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/controller/idea_editor_state.dart';
import 'package:eco_ideas/features/user/data/user_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'idea_editor_controller.g.dart';

@riverpod
class IdeaEditorController extends _$IdeaEditorController {
  @override
  Future<IdeaEditorState> build(String? ideaId) async {
    final profileId = ref.read(userProfileChangesProvider).requireValue.id;

    if (ideaId != null) {
      final idea =
          await ref.read(ideasRepositoryProvider).getIdea(ideaId: ideaId) ??
              EcoIdea.draft(profileId: profileId);

      return IdeaEditorState(idea: idea);
    } else {
      return IdeaEditorState(idea: EcoIdea.draft(profileId: profileId));
    }
  }
}
