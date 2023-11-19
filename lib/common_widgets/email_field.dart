import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField(
      {required this.onChanged,
      this.errorText,
      this.focusNode,
      this.enabled,
      super.key});

  final FocusNode? focusNode;
  final void Function(String) onChanged;
  final String? errorText;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return TextFormField(
      enabled: enabled,
      onChanged: onChanged,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: l10n.emailTextFieldLabelText,
        errorText: errorText,
      ),
    );
  }
}
