import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/utils/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    await ref
        .read(supabaseClientProvider)
        .from(IdeaTable.tableName)
        .insert(idea.toJson());
  }

  Future<List<Idea>> getUserIdeas(String userId) async {
    final result = await ref
        .read(supabaseClientProvider)
        .from(IdeaTable.tableName)
        .select('*,${IdeaTable.steps}:step(*)')
        .eq(IdeaTable.userId, userId);

    return result.map<Idea>(Idea.fromJson).toList();
  }

  Future<String> uploadIdeaImage(String ideaId, XFile imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final fileExt = imageFile.path.split('.').last;
    final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
    final filePath = '$ideaId/$fileName';

    await ref.read(supabaseClientProvider).storage.from('ideas').uploadBinary(
          filePath,
          bytes,
          fileOptions: FileOptions(contentType: imageFile.mimeType),
        );
    final imageUrlResponse = await ref
        .read(supabaseClientProvider)
        .storage
        .from('ideas')
        .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);

    return imageUrlResponse;
  }

  Future<void> deleteIdeaImage(String ideaId) async {}

  Future<Idea> getIdea(String id) async {
    final result = await ref
        .read(supabaseClientProvider)
        .from(IdeaTable.tableName)
        .select('*,${IdeaTable.steps}:step(*)')
        .eq(IdeaTable.id, id)
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
        .from(IdeaTable.tableName)
        .upsert(idea.toJson())
        .match({IdeaTable.id: idea.id})
        .select()
        .limit(1)
        .single();

    return Idea.fromJson(result);
  }
}
