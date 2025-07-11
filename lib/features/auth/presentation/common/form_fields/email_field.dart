
import 'package:eco_ideas/l10n/arb/app_localizations.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({required this.controller, super.key});

  final TextEditingController controller;

  String? validator(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) return l10n.requiredField;
    if (!EmailValidator.validate(value)) {
      return l10n.incorrectFormat;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value, l10n),
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(labelText: l10n.emailAddress, helperText: '',),
    );
  }
}
