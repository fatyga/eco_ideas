import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({required this.focusNode, super.key});

  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(labelText: l10n.passwordTextFieldLabelText),
      obscureText: true,
    );
  }
}
