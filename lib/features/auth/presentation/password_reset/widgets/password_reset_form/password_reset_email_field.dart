import 'package:eco_ideas/common/widgets/email_field.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/password_reset_controller/password_reset_controller.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetEmailField extends ConsumerWidget {
  const PasswordResetEmailField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputState = ref.watch(
      passwordResetControllerProvider
          .select((state) => state.valueOrNull?.emailInput),
    );

    final isLoading = ref.watch(
        passwordResetControllerProvider.select((state) => state.isLoading));

    final l10n = context.l10n;
    return EmailField(
      enabled: !isLoading,
      onChanged:
          ref.read(passwordResetControllerProvider.notifier).updateEmailField,
      errorText: inputState == null
          ? null
          : inputState.isPure
              ? null
              : inputState.isNotValid
                  ? inputState.error!.errorText(l10n)
                  : null,
    );
  }
}
