import 'package:eco_ideas/features/idea/data/idea_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyIdeasScreen extends ConsumerWidget {
  const MyIdeasScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          child: const Text('0a0ff801-1922-4ab3-a93a-d13beee8822a'),
          onPressed: () async {
            final idea = await ref
                .read(ideaRepositoryProvider)
                .getIdea('0a0ff801-1922-4ab3-a93a-d13beee8822a');

            ref.read(selectedIdeaProvider.notifier).state = idea;
            context.go('/ideaEditor');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showModalBottomSheet(
          //     context: context, builder: (context) => IdeaCreatorScreen());
          // context.go('/ideaCreator');

          context.go(
            '/ideaEditor',
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
