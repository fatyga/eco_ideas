
import 'package:eco_ideas/l10n/arb/app_localizations.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    required this.controller,
    this.initialValue,
    this.withHelperText = false,
    super.key,
  });

  final String? initialValue;
  final TextEditingController controller;
  final bool withHelperText;

  String? validator(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.requiredField;
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
        labelText: l10n.title,
        helperText: withHelperText ? l10n.titleHelperText : '',
      ),
    );
  }
}
