import 'package:flutter/material.dart';

class LabeledDivider extends StatelessWidget {
  const LabeledDivider({
    required this.labelText,
    this.verticalSpace = 0,
    super.key,
  });

  final String labelText;
  final double verticalSpace;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalSpace),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const Divider(),
          Container(
            decoration: BoxDecoration(color: theme.scaffoldBackgroundColor),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(labelText, style: TextStyle(color: theme.dividerColor)),
          ),
        ],
      ),
    );
  }
}
