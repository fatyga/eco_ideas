import 'package:eco_ideas/features/auth/presentation/password_reset/second_step/widgets/form/form.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PasswordResetSecondStepScreen extends StatelessWidget {
  const PasswordResetSecondStepScreen({super.key});

  static const String path = 'secondStep';
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.passwordResetSecondStepAppBarTitleText)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PasswordResetSecondStepForm(),
        ],
      ),
    );
  }
}
