import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/password_reset_controller/password_reset_controller.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/password_reset_controller/password_reset_state.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetConfirmButton extends ConsumerWidget {
  const PasswordResetConfirmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isLoading = ref.watch(
      passwordResetControllerProvider.select((state) => state.isLoading),
    );

    final canAttemptPasswordReset = ref.watch(
      passwordResetControllerProvider
          .select((state) => state.valueOrNull?.isValid),
    );
    return PrimaryButton(
      isLoading: isLoading,
      onPressed: isLoading || canAttemptPasswordReset == null
          ? null
          : canAttemptPasswordReset
              ? ref
                  .read(passwordResetControllerProvider.notifier)
                  .resetPasswordForEmail
              : null,
      child: Text(l10n.passwordResetConfirmButtonText),
    );
  }
}
