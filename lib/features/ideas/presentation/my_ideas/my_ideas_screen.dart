import 'package:eco_ideas/features/ideas/data/idea_exception.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/presentation/my_ideas/widgets/ideas_list.dart';
import 'package:eco_ideas/features/user/user.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyIdeasScreen extends ConsumerStatefulWidget {
  const MyIdeasScreen({super.key});

  static const path = 'myIdeas';

  @override
  ConsumerState<MyIdeasScreen> createState() => _MyIdeasScreenState();
}

class _MyIdeasScreenState extends ConsumerState<MyIdeasScreen> {
  late AsyncValue<List<EcoIdeaStep>> ideasIntroductions =
      const AsyncLoading<List<EcoIdeaStep>>();

  @override
  void initState() {
    ideasIntroductions = const AsyncLoading<List<EcoIdeaStep>>();
    fetchIdeasIntroductions();
    super.initState();
  }

  Future<void> fetchIdeasIntroductions() async {
    setState(() {
      ideasIntroductions = const AsyncLoading<List<EcoIdeaStep>>()
          .copyWithPrevious(ideasIntroductions);
    });
    ideasIntroductions = await AsyncValue.guard<List<EcoIdeaStep>>(() async {
      final profileId = ref.read(userProfileChangesProvider).requireValue.id;

      return await ref
          .read(ideasRepositoryProvider)
          .getIdeasIntroductions(profileId: profileId);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Stack(
        children: [
          ideasIntroductions.when(
            data: (ideas) => EcoIdeasList(ideas: ideas, compact: false),
            error: (err, _) => Center(
              child: Text((err as IdeaException).resolveMessageForUser(l10n)),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
