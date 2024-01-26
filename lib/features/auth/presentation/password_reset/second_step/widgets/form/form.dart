import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PasswordResetSecondStepForm extends StatelessWidget {
  const PasswordResetSecondStepForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Text(l10n.passwordResetSecondStepDescription),
        const SizedBox(height: 12),
        const PasswordResetSecondStepPasswordField(),
        const SizedBox(height: 12),
        const PasswordResetSecondStepPasswordRetypeField(),
        const SizedBox(height: 16),
        const PasswordResetSecondStepSubmitButton(),
      ],
    );
  }
}
