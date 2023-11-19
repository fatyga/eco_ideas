import 'package:eco_ideas/common/widgets/email_field.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/password_reset_controller/password_reset_controller.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetScreen extends ConsumerWidget {
  const PasswordResetScreen({super.key});

  static const String path = 'passwordReset';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final controller = ref.watch(passwordResetControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.passwordRecoveryAppBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(l10n.passwordRecoveryFirstStepDescription),
            const SizedBox(height: 8),
            EmailField(
              onChanged: (_) {},
            ),
            ElevatedButton(
              onPressed: controller.resetPasswordForEmail,
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
