import 'package:eco_ideas/features/ideas/data/supabase_ideas_repository.dart/supabase_ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ideas_repository.g.dart';

@riverpod
SupabaseIdeasRepository ideasRepository(IdeasRepositoryRef ref) =>
    SupabaseIdeasRepository(ref);

abstract class IdeasRepository {
  Future<void> createIdea(EcoIdea idea);
}
