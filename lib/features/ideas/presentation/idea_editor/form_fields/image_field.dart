import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

enum IdeaImageFieldStatus {
  remoteLoading,
  remoteLoaded,
  remoteException,
  remoteNotExists,
  localPicked,
  empty
}

class IdeaImageField extends StatefulWidget {
  const IdeaImageField({
    required this.onSubmit,
    required this.stepImageUrl,
    this.withBorder = false,
    super.key,
  });

  final bool withBorder;

  static const String name = 'image';
  final String stepImageUrl;
  final void Function() onSubmit;

  @override
  State<IdeaImageField> createState() => _IdeaImageFieldState();
}

class _IdeaImageFieldState extends State<IdeaImageField> {
  IdeaImageFieldStatus status = IdeaImageFieldStatus.remoteLoading;

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
          Image.network(
            widget.stepImageUrl,
            errorBuilder: (context, error, _) {
              return FormBuilderImagePicker(
                name: IdeaImageField.name,
                maxImages: 1,
                iconColor: theme.colorScheme.primary,
                backgroundColor: Colors.transparent,
                placeholderWidget: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline),
                    Text('Image do no exists, or is unreachable'),
                  ],
                ),
                decoration: InputDecoration(
                  border: widget.withBorder ? null : InputBorder.none,
                  contentPadding: widget.withBorder ? null : EdgeInsets.zero,
                ),
                validator: FormBuilderValidators.required(
                  errorText: l10n.requiredValidatorErrorText,
                ),
              );
            },
          ),
          _IdeaImageFieldControls(
            status: status,
          ),
        ],
      ),
    );
  }
}

class _IdeaImageFieldControls extends StatelessWidget {
  const _IdeaImageFieldControls({required this.status, super.key});

  final IdeaImageFieldStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (status == IdeaImageFieldStatus.remoteException)
          Expanded(
            child:
                MaterialButton(onPressed: () {}, child: const Text('Select')),
          ),
        if (status == IdeaImageFieldStatus.localPicked)
          Expanded(
            child: MaterialButton(onPressed: () {}, child: const Text('Save')),
          ),
        if (status == IdeaImageFieldStatus.localPicked)
          Expanded(
            child:
                MaterialButton(onPressed: () {}, child: const Text('Cancel')),
          ),
      ],
    );
  }
}
