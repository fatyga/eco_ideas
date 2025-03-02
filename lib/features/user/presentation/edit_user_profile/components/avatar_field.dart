import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class AvatarField extends FormField<XFile> {
  AvatarField({
    super.key,
    this.currentAvatarUrl,
    super.onSaved,
  }) : super(
          builder: (FormFieldState<XFile> state) {
            return _CircleAvatarWithPicker(
              currentAvatarUrl: currentAvatarUrl,
              currentImage: state.value,
              onChanged: (image) {
                state.didChange(image);
              },
            );
          },
        );

  final String? currentAvatarUrl;
}

class _CircleAvatarWithPicker extends StatefulWidget {
  const _CircleAvatarWithPicker({
    required this.currentImage,
    required this.onChanged,
    this.currentAvatarUrl,
    super.key,
  });

  final XFile? currentImage;
  final String? currentAvatarUrl;
  final void Function(XFile? image) onChanged;

  @override
  State<_CircleAvatarWithPicker> createState() =>
      _CircleAvatarWithPickerState();
}

class _CircleAvatarWithPickerState extends State<_CircleAvatarWithPicker> {
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
                final image =
                    await picker.pickImage(source: ImageSource.camera);
                widget.onChanged(image);
                context.pop();
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('Take a picture'),
            ),
            TextButton.icon(
              onPressed: () async {
                final image =
                    await picker.pickImage(source: ImageSource.gallery);
                widget.onChanged(image);
                context.pop();
              },
              icon: const Icon(Icons.image_search),
              label: const Text('Select form gallery'),
            ),
            if (widget.currentAvatarUrl != null && widget.currentImage == null)
              Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: Theme.of(context)
                        .colorScheme
                        .copyWith(primary: Colors.red),),
                child: TextButton.icon(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete current avatar'),
                ),
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showModalBottomSheet,
      child: CircleAvatar(
        radius: 72,
        foregroundImage: widget.currentImage == null
            ? null
            : Image.file(File(widget.currentImage!.path)).image,
        child: widget.currentImage == null && widget.currentAvatarUrl == null
            ? const Icon(Icons.portrait, size: 48)
            : null,
      ),
    );
  }
}
