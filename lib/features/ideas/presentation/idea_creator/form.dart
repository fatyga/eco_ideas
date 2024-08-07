import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/ideas/data/idea_exception.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/presentation/common/form_fields/description_field.dart';
import 'package:eco_ideas/features/ideas/presentation/common/form_fields/image_field.dart';
import 'package:eco_ideas/features/ideas/presentation/common/form_fields/title_field.dart';
import 'package:eco_ideas/features/ideas/presentation/common/idea_section/idea_section.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdeaCreatorFrom extends ConsumerStatefulWidget {
  const IdeaCreatorFrom({super.key});

  @override
  ConsumerState<IdeaCreatorFrom> createState() => _IdeaCreatorFromState();
}

class _IdeaCreatorFromState extends ConsumerState<IdeaCreatorFrom> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;

  void _showSnackbarOnError(IdeaException error) {
    if (!mounted) return;
    final l10n = context.l10n;
    final errorText = error.resolveMessageForUser(l10n);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(errorText)));
  }

  Future<void> submit() async {
    final isValid = _formKey.currentState?.saveAndValidate();

    if (isValid != null && isValid) {
      setState(() {
        isLoading = true;
      });

      try {
        ref.read(userProfileChangesProvider).whenData((profile) async {
          final title =
              _formKey.currentState?.value[IdeaTitleField.name] as String;
          final description =
              _formKey.currentState?.value[IdeaDescriptionField.name] as String;

          final image =
              _formKey.currentState?.value[IdeaImageField.name][0] as XFile;
          await ref.read(ideasRepositoryProvider).createIdea(
                idea: EcoIdea.create(
                  userId: profile.id,
                  title: title,
                  description: description,
                ),
                endResultImage: image,
              );
        });
      } on CreateIdeaException catch (e) {
        _showSnackbarOnError(e);
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return FormBuilder(
      key: _formKey,
      enabled: !isLoading,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const IdeaImageField(
              key: ValueKey('ideaCreatorFormImageField'),
              withBorder: true,
            ),
            const SizedBox(height: 12),
            const IdeaTitleField(key: ValueKey('ideaCreatorFormTitleField')),
            const SizedBox(height: 12),
            const IdeaDescriptionField(
              key: ValueKey('ideaCreatorDescriptionField'),
            ),
            const SizedBox(height: 12),
            const IdeaSection(
              sectionType: IdeaSectionType.requirments,
            ),
            const IdeaSection(
              sectionType: IdeaSectionType.benefits,
            ),
            PrimaryButton(
              isLoading: isLoading,
              onPressed: submit,
              child: Text(l10n.ideaCreatorFormSubmitButton),
            ),
          ],
        ),
      ),
    );
  }
}
