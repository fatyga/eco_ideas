import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'idea_editor_controller.g.dart';

@riverpod
class IdeaEditorController extends _$IdeaEditorController {
  @override
  EcoIdea build(EcoIdea? idea) {
    final userId = ref.watch(userProfileChangesProvider).requireValue.id;
    return idea ?? EcoIdea.draft(userId: userId);
  }
}
