import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    this.controller,
    this.match,
    super.key,
  });

  final TextEditingController? controller;

  // If not null, it is a value that this field must match.
  final String? match;

  String? validator(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.requiredField;
    } else if (match != null && value != match) {
      return l10n.passwordMismatch;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value, l10n),
      decoration: InputDecoration(
        labelText: match != null ? l10n.confirmPassword : l10n.password,
        helperText: '',
      ),
      obscureText: true,
    );
  }
}
