import 'package:eco_ideas/features/ideas/data/idea_exception.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class IdeaTitleField extends ConsumerStatefulWidget {
  const IdeaTitleField({
    required this.step,
    required this.onChange,
    super.key,
  });

  final EcoIdeaStep step;
  static const String name = 'title';
  final void Function(EcoIdeaStep) onChange;

  @override
  ConsumerState<IdeaTitleField> createState() => _IdeaTitleFieldState();
}

class _IdeaTitleFieldState extends ConsumerState<IdeaTitleField> {
  final _textFieldKey = GlobalKey<FormBuilderFieldState>();
  late AsyncValue<String?> submission;

  Future<void> submit() async {
    final field = _textFieldKey.currentState?..validate();

    if (field != null && field.isValid && field.value != widget.step.title) {
      setState(() {
        submission = const AsyncLoading<String?>().copyWithPrevious(submission);
      });

      submission = await AsyncValue.guard(() async {
        final updatedStep =
            await ref.read(ideasRepositoryProvider).updateIdeaStep(
                  ideaStep: widget.step.copyWith(title: field.value as String),
                );

        widget.onChange(updatedStep);

        return updatedStep.title;
      });

      setState(() {});
    }
  }

  @override
  void initState() {
    submission = AsyncData<String?>(widget.step.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    submission.whenOrNull(
      error: (error, _) {
        _textFieldKey.currentState
            ?.invalidate((error as IdeaException).message);
      },
    );
    final l10n = context.l10n;
    return Focus(
      onFocusChange: (value) {
        if (!value) submit();
      },
      child: FormBuilderTextField(
        key: _textFieldKey,
        name: IdeaTitleField.name,
        initialValue: widget.step.title,
        onEditingComplete: submit,
        decoration: InputDecoration(
          labelText: l10n.ideaStepTitleFieldLabelText,
          suffixIcon:
              submission.isLoading ? const CircularProgressIndicator() : null,
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
