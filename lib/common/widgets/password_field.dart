import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    required this.onChanged,
    this.errorText,
    this.focusNode,
    this.enabled,
    this.forRetype = false,
    super.key,
  });

  final FocusNode? focusNode;
  final void Function(String) onChanged;
  final String? errorText;
  final bool? enabled;
  final bool forRetype;

  @override
  Widget build(
    BuildContext context,
  ) {
    final l10n = context.l10n;

    return TextFormField(
      enabled: enabled,
      onChanged: onChanged,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: forRetype
            ? l10n.passwordRetypeFieldLabelText
            : l10n.passwordTextFieldLabelText,
        errorText: errorText,
      ),
      obscureText: true,
      autovalidateMode: AutovalidateMode.always,
    );
  }
}
