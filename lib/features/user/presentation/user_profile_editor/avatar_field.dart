import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarField extends FormField<XFile> {
  AvatarField({super.key, super.initialValue, super.onSaved})
      : super(
          builder: (FormFieldState<XFile> state) {
            return _CircleAvatarWithPicker(
              currentImage: state.value,
              onChanged: (image) {
                state.didChange(image);
              },
            );
          },
        );
}

class _CircleAvatarWithPicker extends StatefulWidget {
  const _CircleAvatarWithPicker({
    required this.currentImage,
    required this.onChanged,
    super.key,
  });

  final XFile? currentImage;
  final void Function(XFile? image) onChanged;

  @override
  State<_CircleAvatarWithPicker> createState() =>
      _CircleAvatarWithPickerState();
}

class _CircleAvatarWithPickerState extends State<_CircleAvatarWithPicker> {
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);

    widget.onChanged(image);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 60,
        foregroundImage: widget.currentImage == null
            ? null
            : Image.file(File(widget.currentImage!.path)).image,
      ),
    );
  }
}
