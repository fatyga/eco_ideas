import 'package:eco_ideas/features/ideas/data/idea_exception.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/presentation/my_ideas/widgets/ideas_list.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  static const path = 'explore';

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  late AsyncValue<List<EcoIdeaStep>> ideasIntroductions;

  Future<void> fetchIdeas() async {
    setState(() {
      ideasIntroductions = const AsyncLoading<List<EcoIdeaStep>>()
          .copyWithPrevious(ideasIntroductions);
    });

    ideasIntroductions = await AsyncValue.guard(() async {
      return await ref.read(ideasRepositoryProvider).getIdeasIntroductions();
    });

    setState(() {});
  }

  @override
  void initState() {
    ideasIntroductions = const AsyncLoading<List<EcoIdeaStep>>();
    fetchIdeas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ideasIntroductions.when(
              data: (ideas) => EcoIdeasList(ideas: ideas, compact: true),
              error: (err, _) => Center(
                child: Text((err as IdeaException).resolveMessageForUser(l10n)),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
