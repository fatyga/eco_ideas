import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return TextFormField(
      decoration: InputDecoration(labelText: l10n.emailTextFieldLabelText),
    );
  }
}
