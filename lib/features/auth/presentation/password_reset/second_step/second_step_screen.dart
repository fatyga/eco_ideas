import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/second_step/widgets/exit_dialog.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetSecondStepScreen extends ConsumerWidget {
  const PasswordResetSecondStepScreen({super.key});

  static const String path = 'secondStep';

  Future<bool?> _showCancelDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => const PasswordResetSecondStepExitDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        final shouldCancel = await _showCancelDialog(context);
        if (shouldCancel != null && shouldCancel) {
          await ref
              .read(passwordResetSecondStepControllerProvider.notifier)
              .abortPasswordReset();
        }
      },
      child: Scaffold(
        appBar:
            AppBar(title: Text(l10n.passwordResetSecondStepAppBarTitleText)),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            PasswordResetSecondStepForm(),
          ],
        ),
      ),
    );
  }
}
