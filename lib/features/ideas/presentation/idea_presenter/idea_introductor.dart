import 'package:eco_ideas/common/extensions/snackbar_on_error.dart';
import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';

import 'package:eco_ideas/features/ideas/presentation/idea_presenter/widgets/idea_image.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_presenter/widgets/idea_step_addon_section.dart';

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
  bool forEdit = false;
  Future<void> loadIdea() async {
    setState(() {
      idea = const AsyncLoading<EcoIdea?>();
    });

    idea = await AsyncValue.guard(() async {
      final idea = await ref
          .read(ideasRepositoryProvider)
          .getIdea(ideaId: widget.introduction.ideaId);

      return idea;
    });

    if (mounted) {
      idea.showSnackBarOnError(context);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    idea.whenData((idea) {
      if (idea != null) {
        if (forEdit) {
          IdeaEditorRoute(idea).go(context);
        } else {
          IdeaPresenterRoute(idea).go(context);
        }
      }
    });
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              setState(() {
                forEdit = true;
              });
              loadIdea();
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16),
        children: [
          IdeaImage(imageUrl: widget.introduction.imageUrl),
          const SizedBox(height: 16),
          Text(
            widget.introduction.title,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(widget.introduction.description),
          const SizedBox(height: 32),
          ...widget.introduction.availableAddonTypes.map((addonType) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: IdeaPresenterAddonSection(
                addon: addonType,
                values: widget.introduction.addons
                    .where((addon) => addon.type == addonType)
                    .toList(),
              ),
            );
          }),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          isLoading: idea.isLoading,
          onPressed: () {
            setState(() {
              forEdit = false;
            });
            loadIdea();
          },
          child: const Text('Open'),
        ),
      ),
    );
  }
}
