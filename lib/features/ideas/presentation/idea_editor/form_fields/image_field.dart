import 'package:cross_file/cross_file.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class IdeaImageField extends StatefulWidget {
  const IdeaImageField({
    required this.onSubmit,
    required this.stepImageId,
    this.withBorder = false,
    super.key,
  });

  final bool withBorder;

  static const String name = 'image';
  final String? stepImageId;
  final void Function() onSubmit;

  @override
  State<IdeaImageField> createState() => _IdeaImageFieldState();
}

class _IdeaImageFieldState extends State<IdeaImageField> {
  bool shouldShowControls = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          FormBuilderImagePicker(
            name: IdeaImageField.name,
            maxImages: 1,
            iconColor: theme.colorScheme.primary,
            backgroundColor: Colors.transparent,
            placeholderImage: widget.stepImageId == null
                ? null
                : Image.network(
                    widget.stepImageId!,
                    loadingBuilder: (context, child, loadingProgress) =>
                        const Center(child: CircularProgressIndicator()),
                    errorBuilder: (context, error, _) {
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outline),
                          Text('Could not load the image'),
                        ],
                      );
                    },
                  ).image,
            decoration: InputDecoration(
              border: widget.withBorder ? null : InputBorder.none,
              contentPadding: widget.withBorder ? null : EdgeInsets.zero,
            ),
            onChanged: (value) {
              if (value != null && value.isNotEmpty) {
                setState(() {
                  shouldShowControls = true;
                });
              } else {
                setState(() {
                  shouldShowControls = false;
                });
              }
            },
            validator: FormBuilderValidators.required(
              errorText: l10n.requiredValidatorErrorText,
            ),
          ),
          if (shouldShowControls)
            _IdeaImageFieldControls(
              onSave: () {
                widget.onSubmit();
                setState(() {
                  shouldShowControls = false;
                });
              },
              onCancel: () {
                setState(() {
                  shouldShowControls = false;
                  FormBuilder.of(context)
                      ?.fields[IdeaImageField.name]
                      ?.didChange(const <dynamic>[]);
                });
              },
            ),
        ],
      ),
    );
  }
}

class _IdeaImageFieldControls extends StatelessWidget {
  const _IdeaImageFieldControls({
    required this.onSave,
    required this.onCancel,
    super.key,
  });

  final VoidCallback onSave;
  final VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(onPressed: onSave, child: const Text('Save')),
          ),
          Expanded(
            child: MaterialButton(
              onPressed: onCancel,
              child: const Text('Cancel'),
            ),
          ),
        ],
      ),
    );
  }
}
