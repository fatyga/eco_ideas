import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({required this.controller, super.key});

  final TextEditingController controller;

  String? validator(String? value, AppLocalizations l10n){
    if (value == null || value.isEmpty) return l10n.field_required;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFormField(

      validator: (value) => validator(value, l10n),
      decoration: InputDecoration(
          labelText: l10n.passwordField_label, helperText: '',),
      obscureText: true,
    );
  }
}
