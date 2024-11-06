import 'package:cross_file/cross_file.dart';
import 'package:eco_ideas/features/ideas/data/supabase_ideas_repository.dart/supabase_ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step_addon/eco_idea_step_addon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ideas_repository.g.dart';

@riverpod
SupabaseIdeasRepository ideasRepository(IdeasRepositoryRef ref) =>
    SupabaseIdeasRepository(ref);

abstract class IdeasRepository {
  // Creates new idea and returns inserted data
  Future<EcoIdea> createIdea({required EcoIdea idea});

  Future<EcoIdea?> getIdea({required String ideaId});

  Future<List<EcoIdeaStep>> getUserIdeasIntroductions(
      {required String profileId});

  Future<EcoIdeaStep> updateIdeaStep({required EcoIdeaStep ideaStep});

  Future<EcoIdeaStepAddon> updateIdeaStepAddon({
    required EcoIdeaStepAddon ideaStepAddon,
  });

  Future<String> uploadImage({
    required EcoIdeaStep ideaStep,
    required XFile image,
  });

  Future<void> deleteImage({required EcoIdeaStep ideaStep});
}
