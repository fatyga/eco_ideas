import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
     this.onChanged,
    this.controller,
    super.key,
  });

  final TextEditingController? controller;
  final void Function(String value)? onChanged;

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
        labelText: l10n.description,
        helperText: '',
      ),
    );
  }
}
