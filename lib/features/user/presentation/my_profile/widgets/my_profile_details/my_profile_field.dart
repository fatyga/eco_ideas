import 'package:eco_ideas/theme/constants.dart';
import 'package:flutter/material.dart';

class MyProfileField extends StatelessWidget {
  const MyProfileField(this.label, this.value, {super.key});

  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          '$label:',
          style: theme.textTheme.labelLarge!
              .copyWith(color: detailFieldLabelColor),
        ),
        const SizedBox(width: 4),
        Text(value),
      ],
    );
  }
}
