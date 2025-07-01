
import 'package:eco_ideas/l10n/arb/app_localizations.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class HintField extends StatelessWidget {
  const HintField({required this.controller, super.key});

  final TextEditingController controller;

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
      decoration: const InputDecoration(

        icon:  Icon(Icons.circle, size: 8),
        helperText: '',
      ),
    );
  }
}
