import 'package:eco_ideas/features/auth/presentation/password_reset/password_reset_first_step/widgets/password_reset_first_step_form/password_reset_first_step_confirm_button.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/password_reset_first_step/widgets/password_reset_first_step_form/password_reset_first_step_email_field.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PasswordResetEmailForm extends StatelessWidget {
  const PasswordResetEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Text(l10n.passwordResetFirstStepDescription),
        const SizedBox(height: 8),
        const PasswordResetEmailField(),
        const SizedBox(height: 12),
        const PasswordResetConfirmButton(),
      ],
    );
  }
}
