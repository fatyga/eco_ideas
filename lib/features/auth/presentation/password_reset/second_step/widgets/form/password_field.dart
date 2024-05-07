import 'package:eco_ideas/common/widgets/ei_form/ei_form_fields/password_field.dart';
import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetSecondStepPasswordField extends ConsumerWidget {
  const PasswordResetSecondStepPasswordField({super.key, this.focusNode});

  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final inputState = ref.watch(
      passwordResetSecondStepControllerProvider.select(
        (controllerState) => controllerState.valueOrNull?.passwordInput,
      ),
    );
    final isLoading = ref.watch(
      passwordResetSecondStepControllerProvider
          .select((controllerState) => controllerState.isLoading),
    );
    return PasswordField(
      enabled: !isLoading,
      focusNode: focusNode,
      onChanged: ref
          .read(passwordResetSecondStepControllerProvider.notifier)
          .updatePasswordField,
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
