import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/utils/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'idea_repository.g.dart';

@riverpod
IdeaRepository ideaRepository(Ref ref) => IdeaRepository(ref);

final selectedIdeaProvider = StateProvider<Idea?>((ref) {
  return null;
});

class IdeaRepository {
  const IdeaRepository(this.ref);

  final Ref ref;

  Future<void> createIdea(Idea idea) async {
    await ref.read(supabaseClientProvider).from('idea').insert(idea.toJson());
  }

  Future<List<Idea>> getUserIdeas(String userId) async {
    final result = await ref
        .read(supabaseClientProvider)
        .from('idea')
        .select('*,steps:step(*)')
        .eq('user_id', userId);

    return result.map<Idea>(Idea.fromJson).toList();
  }

  Future<Idea> getIdea(String id) async {
    final result = await ref
        .read(supabaseClientProvider)
        .from('idea')
        .select('*,steps:step(*)')
        .eq('id', id)
        .limit(1)
        .single();

    return Idea.fromJson(result);
  }

  // TODO(fatyga): improve by sending only changed values to database
  Future<IdeaStep> updateStep(IdeaStep step) async {
    final result = await ref
        .read(supabaseClientProvider)
        .from('step')
        .upsert(step.toJson())
        .match({'id': step.id, 'idea_id': step.ideaId})
        .select()
        .limit(1)
        .single();

    return IdeaStep.fromJson(result);
  }

  // TODO(fatyga): improve by sending only changed values to database
  Future<Idea> updateIdeaIntroduction(Idea idea) async {
    final result = await ref
        .read(supabaseClientProvider)
        .from('idea')
        .upsert(idea.toJson())
        .match({'idea_id': idea.id})
        .select()
        .limit(1)
        .single();

    return Idea.fromJson(result);
  }
}
