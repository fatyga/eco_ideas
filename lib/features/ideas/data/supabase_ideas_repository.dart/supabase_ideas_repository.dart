import 'dart:io';

import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/features/ideas/data/idea_exception.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step_addon/eco_idea_step_addon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseIdeasRepository extends IdeasRepository {
  SupabaseIdeasRepository(this.ref);
  final Ref ref;

  @override
  Future<EcoIdea> createIdea({
    required EcoIdea idea,
  }) async {
    try {
      final result = await ref
          .read(supabaseClientProvider)
          .from('idea')
          .insert(idea.toJson())
          .select<PostgrestMap>()
          .single()
          .limit(1);

      final stepsInJson = idea.steps.map((step) => step.toJson()).toList();

      final steps = await ref
          .read(supabaseClientProvider)
          .from('step')
          .insert(stepsInJson)
          .select<PostgrestList>();

      result['steps'] = steps;
      return EcoIdea.fromJson(result);
    } on PostgrestException catch (e) {
      throw CreateIdeaException(e.message);
    }
  }

  @override
  Future<EcoIdea> getIdea({required String ideaId}) async {
    try {
      final json = await ref
          .read(supabaseClientProvider)
          .from('idea')
          .select<PostgrestMap>()
          .eq('id', ideaId);

      // Throw an error, when there is no idea with matching id
      if (json.isEmpty) throw IdeaWasNotFound('Temporary value');
      return EcoIdea.fromJson(json);
    } catch (err, stack) {
      throw IdeaWasNotFound(err.toString());
    }
  }

  @override
  Future<EcoIdeaStep> updateIdeaStep({required EcoIdeaStep ideaStep}) async {
    try {
      final primaryKey = {'id': ideaStep.id, 'idea_id': ideaStep.ideaId};
      final json = await ref
          .read(supabaseClientProvider)
          .from('step')
          .upsert(ideaStep.toJson(), onConflict: primaryKey.keys.join(','))
          .match(primaryKey)
          .select<PostgrestMap>()
          .single();

      return EcoIdeaStep.fromJson(json);
    } on PostgrestException catch (err, stack) {
      throw UploadStepImageException(err.toString());
    }
  }

  @override
  Future<EcoIdeaStepAddon> updateIdeaStepAddon(
      {required EcoIdeaStepAddon ideaStepAddon}) async {
    try {
      final primaryKey = {
        'id': ideaStepAddon.id,
        'step_id': ideaStepAddon.stepId,
        'idea_id': ideaStepAddon.ideaId,
        'type': ideaStepAddon.type.name,
      };

      final json = await ref
          .read(supabaseClientProvider)
          .from('step_addon')
          .upsert(ideaStepAddon.toJson(), onConflict: primaryKey.keys.join(','))
          .match(primaryKey)
          .select<PostgrestMap>()
          .single();

      return EcoIdeaStepAddon.fromJson(json);
    } on PostgrestException catch (err, stack) {
      throw Exception('error');
    }
  }

  @override
  Future<void> uploadImage(
      {required EcoIdeaStep ideaStep, required File image}) async {
    try {
      final path = '${ideaStep.ideaId}/${ideaStep.id}.png';
      await ref
          .read(supabaseClientProvider)
          .storage
          .from('ideas')
          .upload(path, image);
    } on StorageException catch (err, stack) {
      throw UploadStepImageException(err.toString());
    }
  }
}
