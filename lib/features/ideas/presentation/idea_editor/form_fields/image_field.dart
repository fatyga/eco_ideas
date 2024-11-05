import 'package:cross_file/cross_file.dart';
import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

enum IdeaImageFieldStatus {
  readyToPick,
  readyToSave,
  remoteExists,
}

class IdeaImageField extends ConsumerStatefulWidget {
  const IdeaImageField({
    required this.onChange,
    required this.step,
    this.withBorder = false,
    super.key,
  });

  final bool withBorder;

  static const String name = 'image';
  final EcoIdeaStep step;
  final void Function(EcoIdeaStep updatedStep) onChange;

  @override
  ConsumerState<IdeaImageField> createState() => _IdeaImageFieldState();
}

class _IdeaImageFieldState extends ConsumerState<IdeaImageField> {
  late IdeaImageFieldStatus status;
  bool isUploading = false;

  late AsyncValue<String?> imageId;

  @override
  void initState() {
    imageId = AsyncData(widget.step.imageId);
    if (widget.step.imageId != null) {
      status = IdeaImageFieldStatus.remoteExists;
    } else {
      status = IdeaImageFieldStatus.readyToPick;
    }
    super.initState();
  }

  Future<void> uploadImage() async {
    setState(() {
      imageId = const AsyncLoading<String?>().copyWithPrevious(imageId);
    });

    final image = (FormBuilder.of(context)?.fields[IdeaImageField.name]?.value
            as List<dynamic>)
        .first as XFile?;

    if (image != null) {
      imageId = await AsyncValue.guard(() async {
        final imageId = await ref
            .read(ideasRepositoryProvider)
            .uploadImage(ideaStep: widget.step, image: image);

        widget.onChange(widget.step.copyWith(imageId: imageId));
        return imageId;
      });

      imageId.whenOrNull(
        error: (error, _) {
          FormBuilder.of(context)
              ?.fields[IdeaImageField.name]
              ?.invalidate('Failed to upload an image.');
        },
      );

      setState(() {
        status = IdeaImageFieldStatus.remoteExists;
        FormBuilder.of(context)?.fields[IdeaImageField.name]?.reset();
      });
    }
  }

  Future<void> deleteImage() async {
    setState(() {
      imageId = const AsyncLoading<String?>().copyWithPrevious(imageId);
    });

    if (widget.step.imageId != null) {
      imageId = await AsyncValue.guard(() async {
        final imageId = await ref
            .read(ideasRepositoryProvider)
            .deleteImage(ideaStep: widget.step);

        widget.onChange(widget.step.copyWith(imageId: null));
        return null;
      });

      imageId.whenOrNull(
        error: (error, _) {
          FormBuilder.of(context)
              ?.fields[IdeaImageField.name]
              ?.invalidate('Failed to delete an image.');
        },
      );

      setState(() {
        status = IdeaImageFieldStatus.readyToPick;
        FormBuilder.of(context)?.fields[IdeaImageField.name]?.reset();
      });
    }
  }

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
            enabled: !imageId.isLoading,
            maxImages: 1,
            iconColor: theme.colorScheme.primary,
            backgroundColor: Colors.transparent,
            placeholderImage: widget.step.imageId == null
                ? null
                : Image.network(
                    widget.step.imageUrl!,
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
                  status = IdeaImageFieldStatus.readyToSave;
                });
              }
            },
            validator: FormBuilderValidators.required(
              errorText: l10n.requiredValidatorErrorText,
            ),
          ),
          _IdeaImageFieldControls(
            isUploading: imageId.isLoading,
            status: status,
            onSave: uploadImage,
            onDelete: deleteImage,
            onCancel: () {
              setState(() {
                status = IdeaImageFieldStatus.readyToPick;
                FormBuilder.of(context)?.fields[IdeaImageField.name]?.reset();
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
    required this.isUploading,
    required this.status,
    required this.onSave,
    required this.onDelete,
    required this.onCancel,
    super.key,
  });

  final VoidCallback onSave;
  final VoidCallback onCancel;
  final VoidCallback onDelete;
  final IdeaImageFieldStatus status;
  final bool isUploading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          if (status == IdeaImageFieldStatus.remoteExists ||
              status == IdeaImageFieldStatus.readyToPick)
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                child: const Text('Select'),
              ),
            ),
          if (status == IdeaImageFieldStatus.remoteExists)
            Expanded(
              child: MaterialButton(
                onPressed: isUploading ? null : onDelete,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  if (isUploading)
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 8),
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  Text(isUploading ? 'Deleting' : 'Delete')
                ]),
              ),
            ),
          if (status == IdeaImageFieldStatus.readyToSave)
            Expanded(
              child: MaterialButton(
                onPressed: isUploading ? null : onSave,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isUploading)
                      Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(right: 8),
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    Text(isUploading ? 'Saving' : 'Save'),
                  ],
                ),
              ),
            ),
          if (!isUploading && status == IdeaImageFieldStatus.readyToSave)
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
