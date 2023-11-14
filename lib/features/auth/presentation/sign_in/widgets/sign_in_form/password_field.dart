import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField({required this.focusNode, super.key});

  final FocusNode focusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return TextFormField(
      onChanged:
          ref.read(signInControllerProvider.notifier).updatePasswordField,
      focusNode: focusNode,
      decoration: InputDecoration(labelText: l10n.passwordTextFieldLabelText),
      obscureText: true,
    );
  }
}
