import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField(
      {required this.onChanged, this.errorText, this.focusNode, super.key});

  final FocusNode? focusNode;
  final void Function(String) onChanged;
  final String? errorText;

  @override
  Widget build(
    BuildContext context,
  ) {
    final l10n = context.l10n;
    return TextFormField(
      onChanged: onChanged,
      focusNode: focusNode,
      decoration: InputDecoration(
          labelText: l10n.passwordTextFieldLabelText, errorText: errorText),
      obscureText: true,
      autovalidateMode: AutovalidateMode.always,
    );
  }
}
