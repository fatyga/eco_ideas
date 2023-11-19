import 'package:flutter/material.dart';

class LabeledAction extends StatelessWidget {
  const LabeledAction({
    required this.label,
    required this.actionText,
    required this.onActionTap,
    super.key,
  });

  final Text label;
  final Text actionText;
  final VoidCallback onActionTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        label,
        InkWell(onTap: onActionTap, child: actionText),
      ],
    );
  }
}
