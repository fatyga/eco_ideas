import 'dart:io';

import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

enum ImageFieldType { idea, avatar }

class ImageField extends FormField<XFile> {
  ImageField({
    required ImageFieldType type,
    this.imageUrl,
    super.key,
    super.onSaved,
  }) : super(
          builder: (FormFieldState<XFile> state) {
            return ImageFieldImagePicker(
              imageFieldType: type,
              pickedImage: state.value,
              imageUrl: imageUrl,
              onChanged: (XFile? image) async {
                if (image != null) {
                  final rotatedImage =
                      await FlutterExifRotation.rotateImage(path: image.path);
                  state.didChange(XFile(rotatedImage.path));
                } else {
                  state.didChange(image);
                }
              },
            );
          },
        );

  final String? imageUrl;
}

class ImageFieldImagePicker extends StatefulWidget {
  const ImageFieldImagePicker({
    required this.imageFieldType,
    required this.onChanged,
    this.imageUrl,
    this.pickedImage,
    super.key,
  });

  final ImageFieldType imageFieldType;
  final XFile? pickedImage;
  final String? imageUrl;
  final void Function(XFile? image) onChanged;

  @override
  State<ImageFieldImagePicker> createState() => _ImageFieldImagePickerState();
}

class _ImageFieldImagePickerState extends State<ImageFieldImagePicker> {
  Future<void> _showModalBottomSheet() async {
    final picker = ImagePicker();
    await showModalBottomSheet<ImageSource?>(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton.icon(
              onPressed: () async {
                final image = await picker.pickImage(
                  source: ImageSource.camera,
                );
                widget.onChanged(image);

                if (mounted) {
                  context.pop();
                }
              },
              icon: const Icon(Icons.camera_alt),
              label: Text(context.l10n.takeAPicture),
            ),
            TextButton.icon(
              onPressed: () async {
                final image =
                    await picker.pickImage(source: ImageSource.gallery);
                widget.onChanged(image);
                if (context.mounted) {
                  context.pop();
                }
              },
              icon: const Icon(Icons.image_search),
              label: Text(context.l10n.selectFromGallery),
            ),
            if (widget.pickedImage != null)
              Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context)
                      .colorScheme
                      .copyWith(primary: Colors.red),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    widget.onChanged(null);
                    context.pop();
                  },
                  icon: const Icon(Icons.delete),
                  label: Text(context.l10n.discardPickedImage),
                ),
              )
            else if (widget.imageUrl != null)
              Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context)
                      .colorScheme
                      .copyWith(primary: Colors.red),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    widget.onChanged(null);
                    context.pop();
                  },
                  icon: const Icon(Icons.delete),
                  label: Text(context.l10n.deleteUploadedImage),
                ),
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: _showModalBottomSheet,
      child: switch (widget.imageFieldType) {
        ImageFieldType.idea => Stack(
            alignment: Alignment.center,
            children: [
              if (widget.pickedImage != null)
                Image.file(
                  File(widget.pickedImage!.path),
                  fit: BoxFit.contain,
                  height: 240,
                )
              else if (widget.imageUrl != null)
                Image.network(widget.imageUrl!, fit: BoxFit.cover, height: 240)
              else
                Container(
                  color: theme.colorScheme.surfaceContainerHigh,
                  // TODO(fatyga): remove this workaround
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.image_outlined, size: 36),
                      context.spaces.verticalSmall,
                      // TODO(fatyga): set appropriate color
                      Text(l10n.tapToPickImage,
                          style: theme.textTheme.labelLarge!
                              .copyWith(color: theme.colorScheme.surfaceTint))
                    ],
                  ),
                ),
            ],
          ),
        ImageFieldType.avatar => CircleAvatar(
            radius: 72,
            backgroundImage: widget.imageUrl == null
                ? null
                : Image.network(widget.imageUrl!).image,
            foregroundImage: widget.pickedImage == null
                ? null
                : Image.file(
                    File(widget.pickedImage!.path),
                  ).image,
            child: (widget.pickedImage == null && widget.imageUrl == null)
                ? const Icon(Icons.portrait, size: 48)
                : null,
          ),
      },
    );
  }
}
