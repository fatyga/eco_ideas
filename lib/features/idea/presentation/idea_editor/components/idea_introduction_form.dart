import 'package:eco_ideas/features/idea/idea.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdeaIntroductionForm extends ConsumerStatefulWidget {
  const IdeaIntroductionForm({
    required this.idea,
    this.onChange,
    this.withFieldsHelperText = false,
    super.key,
  });

  final Idea idea;
  final void Function(Idea)? onChange;
  final bool withFieldsHelperText;

  @override
  ConsumerState<IdeaIntroductionForm> createState() =>
      _IdeaIntroductionFormState();
}

class _IdeaIntroductionFormState extends ConsumerState<IdeaIntroductionForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleFieldController;
  late final TextEditingController _descriptionFieldController;

  @override
  void initState() {
    super.initState();
    _titleFieldController = TextEditingController(text: widget.idea.title);
    _descriptionFieldController =
        TextEditingController(text: widget.idea.description);
  }

  Idea? _validateAndSave() {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      final updatedIdea = widget.idea.copyWith(
        title: _titleFieldController.text,
        description: _descriptionFieldController.text,
      );

      return updatedIdea != widget.idea ? updatedIdea : null;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(ideaEditorControllerProvider, (_, current) {
      if (current.requireValue.isSaveChangesRequested) {
        final updatedIdea = _validateAndSave();

        if (updatedIdea != null) {
          ref
              .read(ideaEditorControllerProvider.notifier)
              .saveIntroductionChanges(updatedIdea);
        }
      }
    });

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TitleField(
            controller: _titleFieldController,
            withHelperText: widget.withFieldsHelperText,
          ),
          DescriptionField(
            controller: _descriptionFieldController,
            withHelperText: widget.withFieldsHelperText,
          ),
        ],
      ),
    );
  }
}
