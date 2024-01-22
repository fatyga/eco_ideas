import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/second_step/controller/state.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetSecondStepSubmitButton extends ConsumerWidget {
  const PasswordResetSecondStepSubmitButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isLoading =
        ref.watch(passwordResetSecondStepControllerProvider).isLoading;

    final canAttemptSettingNewPassword = ref.watch(
        passwordResetSecondStepControllerProvider
            .select((controllerState) => controllerState.valueOrNull?.isValid));

    return PrimaryButton(
      isLoading: isLoading,
      onPressed: isLoading || canAttemptSettingNewPassword == null
          ? null
          : canAttemptSettingNewPassword
              ? ref
                  .read(passwordResetSecondStepControllerProvider.notifier)
                  .setNewPassword
              : null,
      child: Text(l10n.passwordResetConfirmButtonText),
    );
  }
}
