import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class IdeaIntroductionForm extends ConsumerStatefulWidget {
  const IdeaIntroductionForm({
    required this.idea,
    this.withFieldsHelperText = false,
    super.key,
  });

  final Idea idea;
  final bool withFieldsHelperText;

  @override
  ConsumerState<IdeaIntroductionForm> createState() =>
      _IdeaIntroductionFormState();
}

class _IdeaIntroductionFormState extends ConsumerState<IdeaIntroductionForm> {
  final _formKey = GlobalKey<FormState>();

  XFile? image;
  late final TextEditingController _titleFieldController;
  late final TextEditingController _descriptionFieldController;
  late List<String> _essentials;

  @override
  void initState() {
    super.initState();
    _titleFieldController = TextEditingController(text: widget.idea.title);
    _descriptionFieldController =
        TextEditingController(text: widget.idea.description);
    _essentials = widget.idea.essentials;
  }

  Idea? _validateAndSave() {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      _formKey.currentState!.save();
      final updatedIdea = widget.idea.copyWith(
        title: _titleFieldController.text,
        description: _descriptionFieldController.text,
        essentials: _essentials,
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
              .saveIntroductionChanges(updatedIdea, image);
        }
      }
    });

    return Form(
      key: _formKey,
      child: ListView(
        children: [
          ImageField(
            type: ImageFieldType.idea,
            imageUrl: widget.idea.imageUrl,
            // TODO(fatyga): change the way how image is saved
            onSaved: (file) {
              setState(() {
                image = file;
              });
            },
          ),
          context.spaces.verticalLarge,
          TitleField(
            controller: _titleFieldController,
            withHelperText: widget.withFieldsHelperText,
          ),
          DescriptionField(
            controller: _descriptionFieldController,
            withHelperText: widget.withFieldsHelperText,
          ),
          context.spaces.verticalLarge,
          IdeaAddon(
            addonType: IdeaAddonType.essentials,
            items: _essentials,
            onConfirm: (values) {
              _essentials = values;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
