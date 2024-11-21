import 'package:eco_ideas/features/ideas/data/idea_exception.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class IdeaDescriptionField extends ConsumerStatefulWidget {
  const IdeaDescriptionField(
      {required this.onChange, required this.step, super.key});

  static const String name = 'description';
  final EcoIdeaStep step;
  final void Function(EcoIdeaStep updatedStep) onChange;

  @override
  ConsumerState<IdeaDescriptionField> createState() =>
      _IdeaDescriptionFieldState();
}

class _IdeaDescriptionFieldState extends ConsumerState<IdeaDescriptionField> {
  final _fieldKey = GlobalKey<FormBuilderFieldState>();
  late AsyncValue<String> submission;

  Future<void> submit() async {
    final field = _fieldKey.currentState?..validate();

    if (field != null &&
        field.isValid &&
        field.value != widget.step.description) {
      setState(() {
        submission = const AsyncLoading<String>().copyWithPrevious(submission);
      });

      submission = await AsyncValue.guard(() async {
        final updatedStep =
            await ref.read(ideasRepositoryProvider).updateIdeaStep(
                  ideaStep:
                      widget.step.copyWith(description: field.value as String),
                );
        field.save();
        widget.onChange(updatedStep);
        return updatedStep.description;
      });

      setState(() {});
    }
  }

  @override
  void initState() {
    submission = AsyncData<String>(widget.step.description);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    submission.whenOrNull(
      error: (error, _) {
        _fieldKey.currentState?.invalidate((error as IdeaException).message);
      },
    );
    return Focus(
      onFocusChange: (value) {
        if (!value) submit();
      },
      child: FormBuilderTextField(
        key: _fieldKey,
        initialValue: widget.step.description,
        name: IdeaDescriptionField.name,
        maxLines: null,
        decoration: InputDecoration(
          labelText: l10n.ideaStepDescriptionFieldLabelText,
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            errorText: l10n.requiredValidatorErrorText,
          ),
        ]),
      ),
    );
  }
}
