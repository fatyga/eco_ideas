import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/features/ideas/data/idea_exception.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseIdeasRepository extends IdeasRepository {
  SupabaseIdeasRepository(this.ref);
  final Ref ref;

  @override
  Future<void> createIdea({
    required EcoIdea idea,
  }) async {
    try {
      await ref
          .read(supabaseClientProvider)
          .from('draft')
          .insert(idea.toJson());
    } on PostgrestException catch (e) {
      throw CreateIdeaException(e.message);
    }
  }

  @override
  Future<EcoIdea?> getIdea({required String ideaId}) async {
    final json = await ref
        .read(supabaseClientProvider)
        .from('idea')
        .select<PostgrestMap>()
        .eq('id', ideaId);

    // Return null, when there is no an idea with matching id
    if (json.isEmpty) return null;

    return EcoIdea.fromJson(json);
  }
}
