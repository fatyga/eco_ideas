
import 'package:eco_ideas/l10n/arb/app_localizations.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({
    required this.controller,
    this.shouldBeEqualTo,
    super.key,
  });

  final TextEditingController controller;

  // TODO(fatyga): change this name to more meaningful
  final String? shouldBeEqualTo;

  String? validator(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.requiredField;
    } else if (shouldBeEqualTo != null && value != shouldBeEqualTo) {
      return l10n.passwordMismatch;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFormField(

      validator: (value) => validator(value, l10n),
      decoration: InputDecoration(
        labelText:
            shouldBeEqualTo != null ? l10n.confirmPassword : l10n.password,
        helperText: '',
      ),
      obscureText: true,
    );
  }
}
