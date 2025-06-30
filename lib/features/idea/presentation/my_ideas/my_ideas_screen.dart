import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyIdeasScreen extends ConsumerWidget {
  const MyIdeasScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    // TODO(fatyga): keep provider alive once it was initialized
    final ideas = ref.watch(myIdeasControllerProvider);

    ref.listen(myIdeasControllerProvider, (_, current) => print(current));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [Tab(text: l10n.published), Tab(text: l10n.drafts)],
          ),
        ),
        body: ideas.when(
          data: (ideas) {
            return TabBarView(
              children: [
                RefreshIndicator(
                  onRefresh: () =>
                      ref.refresh(myIdeasControllerProvider.future),
                  child: ListView(
                    padding: context.paddings.allStandard,
                    children: ideas
                        .where((idea) => idea.published)
                        .map((idea) => IdeaCard(idea: idea))
                        .toList(),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () =>
                      ref.refresh(myIdeasControllerProvider.future),
                  child: ListView(
                    padding: context.paddings.allStandard,
                    children: ideas
                        .where((idea) => !idea.published)
                        .map((idea) => Padding(
                              padding: context.paddings.verticalSmall,
                              child: IdeaCard(idea: idea),
                            ))
                        .toList(),
                  ),
                ),
              ],
            );
          },
          error: (error, _) =>
              const Center(child: Text('Failed to load your ideas')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
        floatingActionButton: ideas.isLoading
            ? null
            : FloatingActionButton(
                heroTag: 'my_ideas_fab',
                onPressed: () {
                  context.go(
                    '/ideaEditor',
                  );
                },
                child: const Icon(Icons.add),
              ),
      ),
    );
  }
}
