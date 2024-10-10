import 'dart:io';

import 'package:eco_ideas/common/extensions/snackbar_on_error.dart';
import 'package:eco_ideas/common/widgets/user_avatar/avatar_dialog/save_button.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';

import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/mutable_eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/idea_editor_save_button.dart';

import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/idea_step_form.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/step_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdeaEditorScreen extends ConsumerStatefulWidget {
  const IdeaEditorScreen({required this.idea, super.key});

  // If null, it means that user wants to create new idea
  final EcoIdea? idea;
  static const String routePath = 'ideaEditor';

  @override
  ConsumerState<IdeaEditorScreen> createState() => _IdeaEditorScreenState();
}

class _IdeaEditorScreenState extends ConsumerState<IdeaEditorScreen> {
  late AsyncValue<EcoIdea> idea;
  late int currentStepId;

  EcoIdeaStep get currentStep => idea.requireValue.steps[currentStepId];

  late bool shouldCreateIdeaOnFirstModification;

  @override
  void initState() {
    if (widget.idea == null) {
      final profileId = ref.read(userProfileChangesProvider).requireValue.id;
      idea = AsyncValue.data(EcoIdea.draft(profileId: profileId));

      shouldCreateIdeaOnFirstModification = true;
    } else {
      idea = AsyncValue.data(widget.idea!);
      shouldCreateIdeaOnFirstModification = false;
    }
    currentStepId = 0;

    super.initState();
  }

  Future<void> onStepModification(EcoIdeaStep alteredStep) async {
    setState(() {
      idea = const AsyncLoading<EcoIdea>().copyWithPrevious(idea);
    });

    if (shouldCreateIdeaOnFirstModification) {
      idea = await AsyncValue.guard(
        () async => ref
            .read(ideasRepositoryProvider)
            .createIdea(idea: idea.requireValue),
      );

      shouldCreateIdeaOnFirstModification = false;
    }

    idea = await AsyncValue.guard(() async {
      final updatedStep = await ref
          .read(ideasRepositoryProvider)
          .updateIdeaStep(ideaStep: alteredStep);
      return idea.requireValue.updateStep(updatedStep);
    });

    if (mounted) {
      idea.showSnackBarOnError(context);
    }

    setState(() {});
  }

  Future<void> uploadImage(File image) async {
    setState(() {
      idea = const AsyncLoading<EcoIdea>().copyWithPrevious(idea);
    });
  }

  // Step indicator
  void onStepAdd() => setState(() {
        idea = AsyncData(idea.requireValue.addStep());
        currentStepId = idea.requireValue.steps.last.id;
      });

  void onStepIdChange(int stepId) => setState(() {
        currentStepId = stepId;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IdeaEditorSaveButton(isSaving: idea.isLoading, onPressed: () {}),
        ],
      ),
      bottomSheet: StepIndicator(
        currentStepId: currentStepId,
        lastStepId: idea.requireValue.steps.last.id,
        onStepAdd: onStepAdd,
        onStepIdChange: onStepIdChange,
      ),
      body: IdeaStepForm(
        key: ValueKey('ideaStep${currentStepId}Form'),
        step: currentStep,
        onChange: onStepModification,
        onImageChanged: uploadImage,
      ),
    );
  }
}
