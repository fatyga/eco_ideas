import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFormField(
      decoration: InputDecoration(labelText: l10n.passwordTextFieldLabelText),
      obscureText: true,
    );
  }
}
