import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class IdeaStepForm extends ConsumerStatefulWidget {
  const IdeaStepForm({
    required this.ideaStep,
    this.onChanged,
    super.key,
  });

  final IdeaStep ideaStep;

  final void Function(IdeaStep idea)? onChanged;

  @override
  ConsumerState<IdeaStepForm> createState() => _IdeaStepFormState();
}

class _IdeaStepFormState extends ConsumerState<IdeaStepForm> {
  final _formKey = GlobalKey<FormState>();

  XFile? image;
  late final TextEditingController _titleFieldController;
  late final TextEditingController _descriptionFieldController;

  @override
  void initState() {
    super.initState();
    _titleFieldController = TextEditingController(text: widget.ideaStep.title);
    _descriptionFieldController =
        TextEditingController(text: widget.ideaStep.description);
  }

  IdeaStep? _validateAndSave() {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      _formKey.currentState!.save();
      final updatedIdeaStep = widget.ideaStep.copyWith(
        title: _titleFieldController.text,
        description: _descriptionFieldController.text,
      );

      return updatedIdeaStep != widget.ideaStep ? updatedIdeaStep : null;
    } else {
      return null;
    }
  }

  @override
  void didUpdateWidget(covariant IdeaStepForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    _titleFieldController.text = widget.ideaStep.title ?? '';
    _descriptionFieldController.text = widget.ideaStep.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(ideaEditorControllerProvider, (_, current) {
      if (current.requireValue.isSaveChangesRequested) {
        final updatedIdeaStep = _validateAndSave();

        if (updatedIdeaStep != null ) {
          ref
              .read(ideaEditorControllerProvider.notifier)
              .saveStepChanges(updatedIdeaStep, image);
        }
      }
    });
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          ImageField(
            type: ImageFieldType.idea,
            imageUrl: widget.ideaStep.imageUrl,
            // TODO(fatyga): change the way how image is saved
            onSaved: (file) {
              setState(() {
                image = file;
              });
            },
          ),
          context.spaces.verticalLarge,
          TitleField(
            key: ValueKey('step${widget.ideaStep.id}title'),
            controller: _titleFieldController,
          ),
          DescriptionField(
            key: ValueKey('step${widget.ideaStep.id}description'),
            controller: _descriptionFieldController,
          ),
        ],
      ),
    );
  }
}
