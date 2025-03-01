import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/utils/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'idea_repository.g.dart';

@riverpod
IdeaRepository ideaRepository(Ref ref) => IdeaRepository(ref);

class IdeaRepository {
  const IdeaRepository(this.ref);

  final Ref ref;

  Future<void> createIdea(Idea idea) async {
    await ref.read(supabaseClientProvider).from('idea').insert(idea.toJson());
  }

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

  Future<Idea> updateIdea(Idea idea) async {
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
