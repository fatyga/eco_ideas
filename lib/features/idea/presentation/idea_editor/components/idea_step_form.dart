import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class IdeaStepForm extends ConsumerStatefulWidget {
  const IdeaStepForm({
    required this.ideaStep,
    super.key,
  });

  final IdeaStep ideaStep;

  @override
  ConsumerState<IdeaStepForm> createState() => _IdeaStepFormState();
}

class _IdeaStepFormState extends ConsumerState<IdeaStepForm> {
  final _formKey = GlobalKey<FormState>();

  XFile? _image;
  late final TextEditingController _titleFieldController;
  late final TextEditingController _descriptionFieldController;
  late List<String> _hints;

  @override
  void initState() {
    super.initState();
    _titleFieldController = TextEditingController(text: widget.ideaStep.title);
    _descriptionFieldController =
        TextEditingController(text: widget.ideaStep.description);
    _hints = widget.ideaStep.hints;
  }

  IdeaStep? _validateAndSave() {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      _formKey.currentState!.save();
      final updatedIdeaStep = widget.ideaStep.copyWith(
        title: _titleFieldController.text,
        description: _descriptionFieldController.text,
        hints: _hints,
      );

      return updatedIdeaStep != widget.ideaStep ? updatedIdeaStep : null;
    } else {
      return null;
    }
  }

  @override
  void didUpdateWidget(covariant IdeaStepForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    //Updates form fields only if saving was successful
    if (oldWidget.ideaStep != widget.ideaStep) {
      _titleFieldController.text = widget.ideaStep.title ?? '';
      _descriptionFieldController.text = widget.ideaStep.description ?? '';
      _hints = widget.ideaStep.hints;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(ideaEditorControllerProvider, (prev, current) {
      if (!prev!.requireValue.isSaveChangesRequested &&
          current.requireValue.isSaveChangesRequested) {
        final updatedIdeaStep = _validateAndSave();

        if (updatedIdeaStep != null) {
          ref
              .read(ideaEditorControllerProvider.notifier)
              .saveStepChanges(updatedIdeaStep, _image);
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
                _image = file;
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
          context.spaces.verticalLarge,
          IdeaAddon(
            addonType: IdeaAddonType.hints,
            items: _hints,
            onConfirm: (values) {
              _hints = values;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
