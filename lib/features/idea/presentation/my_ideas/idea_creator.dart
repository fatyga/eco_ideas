import 'package:eco_ideas/features/idea/data/idea_repository.dart';
import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/features/user/data/data.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IdeaCreatorScreen extends ConsumerStatefulWidget {
  const IdeaCreatorScreen({super.key});

  @override
  ConsumerState<IdeaCreatorScreen> createState() => _IdeaCreatorScreenState();
}

class _IdeaCreatorScreenState extends ConsumerState<IdeaCreatorScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleFieldController = TextEditingController();
  final TextEditingController _descriptionFieldController =
      TextEditingController();

  Future<void> _validateAndSave() async {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      final userId = ref.read(userRepositoryProvider).currentUser!.id;

      final idea = Idea.empty(userId: userId).copyWith(
        title: _titleFieldController.text,
        description: _descriptionFieldController.text,
      );
      await ref.read(ideaRepositoryProvider).createIdea(idea);

      if (mounted) {

        context.go('/ideaEditor', extra: idea);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.createIdea),
      ),
      body: Padding(
        padding: context.paddings.allLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TitleField(
                    controller: _titleFieldController,
                    withHelperText: true,
                  ),
                  DescriptionField(
                    controller: _descriptionFieldController,
                    withHelperText: true,
                  ),
                ],
              ),
            ),
            const Spacer(),
            FilledButton(
              onPressed: _validateAndSave,
              child: Text(l10n.createIdeaAndProceedToEditor),
            ),
          ],
        ),
      ),
    );
  }
}
