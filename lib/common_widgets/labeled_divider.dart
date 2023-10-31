import 'package:flutter/material.dart';

class LabeledDivider extends StatelessWidget {
  const LabeledDivider({required this.labelText, super.key});

  final String labelText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        const Divider(),
        Container(
          decoration: BoxDecoration(color: theme.colorScheme.background),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(labelText, style: TextStyle(color: theme.dividerColor)),
        ),
      ],
    );
  }
}
