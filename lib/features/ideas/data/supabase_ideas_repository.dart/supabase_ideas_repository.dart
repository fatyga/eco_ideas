import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/features/ideas/data/idea_exception.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
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

      // Throw an error, when there is no an idea with matching id
      if (json.isEmpty) throw IdeaWasNotFound('Temporary value');
      return EcoIdea.fromJson(json);
    } catch (err, stack) {
      throw IdeaWasNotFound(err.toString());
    }
  }

  Future<List<EcoIdeaStep>> getIdeaSteps({required String ideaId}) async {
    try {
      final stepsJson = await ref
          .read(supabaseClientProvider)
          .from('step')
          .select<PostgrestList>()
          .eq('ideaId', ideaId);

      return stepsJson.map<EcoIdeaStep>(EcoIdeaStep.fromJson).toList();
    } catch (err, stack) {
      throw Exception('Temporary');
    }
  }
}
