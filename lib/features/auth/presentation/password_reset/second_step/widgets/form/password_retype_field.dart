import 'package:eco_ideas/common/widgets/password_field.dart';
import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetSecondStepPasswordRetypeField extends ConsumerWidget {
  const PasswordResetSecondStepPasswordRetypeField({super.key, this.focusNode});

  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final inputState = ref.watch(
      passwordResetSecondStepControllerProvider.select(
        (controllerState) => controllerState.valueOrNull?.passwordRetypeInput,
      ),
    );
    final isLoading = ref.watch(
      passwordResetSecondStepControllerProvider
          .select((controllerState) => controllerState.isLoading),
    );

    final passwordInputState = ref.watch(
      passwordResetSecondStepControllerProvider.select(
        (controllerState) => controllerState.valueOrNull?.passwordInput,
      ),
    );

    final bool shouldBeEnabled;
    if (passwordInputState == null) {
      shouldBeEnabled = false;
    } else {
      shouldBeEnabled = !isLoading &&
          (!passwordInputState.isPure && passwordInputState.isValid);
    }

    return PasswordField(
      forRetype: true,
      focusNode: focusNode,
      enabled: shouldBeEnabled,
      onChanged: ref
          .read(passwordResetSecondStepControllerProvider.notifier)
          .updatePasswordRetypeField,
      errorText: inputState == null ||
              !shouldBeEnabled // if passwordInput is invalid, we don't want to show errorText
          ? null
          : inputState.isPure
              ? null
              : inputState.isNotValid
                  ? inputState.error!.errorText(l10n)
                  : null,
    );
  }
}
