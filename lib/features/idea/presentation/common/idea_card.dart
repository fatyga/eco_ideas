import 'package:eco_ideas/features/idea/data/idea_repository.dart';
import 'package:eco_ideas/features/idea/idea.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IdeaCard extends ConsumerWidget {
  const IdeaCard({required this.idea, super.key});

  final Idea idea;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return ListTile(
      title: Text(idea.title ?? ''),
      subtitle: Text(idea.description ?? ''),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          ref.read(selectedIdeaProvider.notifier).state = idea;
          context.go('/ideaEditor');
        },
      ),

    );
  }
}
