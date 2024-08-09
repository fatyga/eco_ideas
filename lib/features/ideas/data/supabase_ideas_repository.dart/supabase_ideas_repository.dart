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
    required XFile endResultImage,
  }) async {
    try {
      await ref.read(supabaseClientProvider).from('idea').insert(idea.toJson());

      await ref.read(supabaseClientProvider).storage.from('ideas').upload(
            '${idea.userId}/${idea.id}/endResult.png',
            File(endResultImage.path),
          );
    } on PostgrestException catch (e) {
      throw CreateIdeaException(e.message);
    }
  }
}
