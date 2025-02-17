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
}
