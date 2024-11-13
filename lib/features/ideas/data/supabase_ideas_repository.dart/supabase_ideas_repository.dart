import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/features/ideas/data/idea_exception.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step_addon/eco_idea_step_addon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SupabaseIdeasRepository extends IdeasRepository {
  SupabaseIdeasRepository(this.ref);
  final Ref ref;

  // Idea
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
      final ideaJson = await ref
          .read(supabaseClientProvider)
          .from('idea')
          .select<PostgrestMap>()
          .eq('id', ideaId)
          .limit(1)
          .single();

      final stepsJson = await ref
          .read(supabaseClientProvider)
          .from('step')
          .select<PostgrestList>()
          .eq('idea_id', ideaId)
          .order('id', ascending: true);

      for (final step in stepsJson) {
        final addons = await getIdeaStepAddons(
          id: step['id'] as int,
          ideaId: step['idea_id'] as String,
        );
        step['addons'] = addons;
      }

      // Throw an error, when there is no idea with matching id
      if (ideaJson.isEmpty || stepsJson.isEmpty) {
        throw IdeaWasNotFound('Temporary value');
      }
      ideaJson['steps'] = stepsJson;
      return EcoIdea.fromJson(
        ideaJson,
      );
    } on PostgrestException catch (err) {
      throw IdeaWasNotFound(err.toString());
    }
  }

  @override
  Future<List<EcoIdeaStep>> getUserIdeasIntroductions({
    required String profileId,
  }) async {
    try {
      final introductions = await ref
          .read(supabaseClientProvider)
          .from('step')
          .select<PostgrestList>('*, idea(profile_id)')
          .match({'id': '0', 'idea.profile_id': profileId});

      for (final step in introductions) {
        final addons = await getIdeaStepAddons(
          id: step['id'] as int,
          ideaId: step['idea_id'] as String,
        );
        step['addons'] = addons;
      }

      return introductions.map(EcoIdeaStep.fromJson).toList();
    } on PostgrestException catch (error, _) {
      throw GetUserIdeasException(error.toString());
    }
  }

  // Idea step
  @override
  Future<List<Map<String, dynamic>>> getIdeaStepAddons({
    required int id,
    required String ideaId,
  }) async {
    try {
      final addonsJson = await ref
          .read(supabaseClientProvider)
          .from('step_addon')
          .select<PostgrestList>()
          .match({'id': id, 'idea_id': ideaId}).order('id', ascending: true);

      return addonsJson;
    } on PostgrestException catch (error, _) {
      throw GetIdeaStepAddonsException(error.message);
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
    } on PostgrestException catch (err) {
      throw UploadStepImageException(err.toString());
    }
  }

  @override
  Future<EcoIdeaStepAddon> updateIdeaStepAddon({
    required EcoIdeaStepAddon ideaStepAddon,
  }) async {
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
    } on PostgrestException catch (err) {
      throw UpdateIdeaStepAddonException(err.message);
    }
  }

  // Idea step image
  @override
  Future<String> uploadImage({
    required EcoIdeaStep ideaStep,
    required XFile image,
  }) async {
    try {
      final primaryKey = {'id': ideaStep.id, 'idea_id': ideaStep.ideaId};
      final uid = const Uuid().v4();
      final path = '${ideaStep.ideaId}/$uid.png';

      await ref
          .read(supabaseClientProvider)
          .storage
          .from('ideas')
          .upload(path, File(image.path));

      await ref
          .read(supabaseClientProvider)
          .from('step')
          .update({'image_id': uid}).match(primaryKey);

      return uid;
    } on StorageException catch (err) {
      throw UploadStepImageException(err.toString());
    }
  }

  @override
  Future<void> deleteImage({required EcoIdeaStep ideaStep}) async {
    try {
      final primaryKey = {'id': ideaStep.id, 'idea_id': ideaStep.ideaId};

      final path = '${ideaStep.ideaId}/${ideaStep.imageId}.png';

      await ref
          .read(supabaseClientProvider)
          .storage
          .from('ideas')
          .remove([path]);

      await ref
          .read(supabaseClientProvider)
          .from('step')
          .update({'image_id': null}).match(primaryKey);
    } on StorageException catch (err) {
      throw UploadStepImageException(err.toString());
    }
  }
}
