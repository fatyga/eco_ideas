import 'package:flutter/material.dart';

class IdeaEditorSaveButton extends StatelessWidget {
  const IdeaEditorSaveButton(
      {required this.isSaving, required this.onPressed, super.key});

  final bool isSaving;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: isSaving ? null : onPressed, icon: const Icon(Icons.save));
  }
}
