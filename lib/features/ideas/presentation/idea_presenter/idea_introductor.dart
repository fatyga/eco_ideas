import 'package:eco_ideas/common/exceptions/ei_exception.dart';
import 'package:eco_ideas/common/extensions/snackbar_on_error.dart';
import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdeaIntroductorScreen extends ConsumerStatefulWidget {
  const IdeaIntroductorScreen({required this.introduction, super.key});

  static const String path = 'ideaIntroductor';
  final EcoIdeaStep introduction;

  @override
  ConsumerState<IdeaIntroductorScreen> createState() =>
      _IdeaIntroductorScreenState();
}

class _IdeaIntroductorScreenState extends ConsumerState<IdeaIntroductorScreen> {
  AsyncValue<EcoIdea?> idea = const AsyncData<EcoIdea?>(null);

  Future<void> fetchIdea() async {
    setState(() {
      idea = const AsyncLoading<EcoIdea?>();
    });

    idea = await AsyncValue.guard(() async {
      final idea = await ref
          .read(ideasRepositoryProvider)
          .getIdea(ideaId: widget.introduction.ideaId);

      return idea;
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    idea
      ..whenData((idea) {
        if (idea != null) {
          IdeaEditorRoute(idea).go(context);
        }
      })
      ..showSnackBarOnError(context);

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16),
        children: [
          if (widget.introduction.imageUrl == null)
            const SizedBox(
              height: 160,
              child: Center(child: Text('Image was not added.')),
            )
          else
            Image.network(widget.introduction.imageUrl!, height: 160),
          const SizedBox(height: 16),
          Text(widget.introduction.title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(widget.introduction.description),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          isLoading: idea.isLoading,
          onPressed: fetchIdea,
          child: const Text('Open'),
        ),
      ),
    );
  }
}
