import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/presentation/my_ideas/widgets/my_ideas_list.dart';
import 'package:eco_ideas/features/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyIdeasScreen extends ConsumerStatefulWidget {
  const MyIdeasScreen({super.key});

  static const path = 'myIdeas';

  @override
  ConsumerState<MyIdeasScreen> createState() => _MyIdeasScreenState();
}

class _MyIdeasScreenState extends ConsumerState<MyIdeasScreen> {
  late AsyncValue<List<EcoIdeaStep>> ideas =
      const AsyncLoading<List<EcoIdeaStep>>();

  @override
  void initState() {
    load();
    super.initState();
  }

  Future<void> load() async {
    setState(() {
      ideas = const AsyncLoading<List<EcoIdeaStep>>().copyWithPrevious(ideas);
    });
    ideas = await AsyncValue.guard<List<EcoIdeaStep>>(() async {
      final profileId = ref.read(userProfileChangesProvider).requireValue.id;

      return await ref
          .read(ideasRepositoryProvider)
          .getUserIdeas(profileId: profileId);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ideas.when(
        data: (ideas) => MyIdeasList(ideas: ideas),
        error: (err, _) => Center(child: Text(err.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
