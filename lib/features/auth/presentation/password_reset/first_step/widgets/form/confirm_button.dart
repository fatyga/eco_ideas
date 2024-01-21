import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/first_step/controller/controller.dart';

import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetConfirmButton extends ConsumerWidget {
  const PasswordResetConfirmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isLoading = ref.watch(
      passwordResetFirstStepControllerProvider
          .select((state) => state.isLoading),
    );

    final canSendLink = ref.watch(
      passwordResetFirstStepControllerProvider
          .select((state) => state.valueOrNull?.isLinkSent),
    );
    return PrimaryButton(
      isLoading: isLoading,
      onPressed: isLoading || canSendLink == null
          ? null
          : canSendLink
              ? ref
                  .read(passwordResetFirstStepControllerProvider.notifier)
                  .resetPasswordForEmail
              : null,
      child: Text(l10n.passwordResetConfirmButtonText),
    );
  }
}
