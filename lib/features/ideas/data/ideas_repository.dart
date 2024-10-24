import 'dart:io';

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

  Future<EcoIdeaStep> updateIdeaStep({required EcoIdeaStep ideaStep});

  Future<EcoIdeaStepAddon> updateIdeaStepAddon({
    required EcoIdeaStepAddon ideaStepAddon,
  });

  Future<void> uploadImage({
    required EcoIdeaStep ideaStep,
    required File image,
  });
}
